resource "aws_s3_bucket_policy" "cloudfront_bucket_policy" {
  bucket = var.bucket_id
  policy = jsonencode({
    Statement = [
      {
        Action = "s3:GetObject"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Resource = "arn:aws:s3:::${var.bucket_id}/*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "${var.aws_cloudfront_distribution_arn}"
          }
        }
      },
    ]
    Version = "2012-10-17"
  })
}

resource "aws_kms_key_policy" "cloudfront_kms_policy" {
  key_id = var.bucket_encryption_key_id
  policy = jsonencode({
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          "AWS" = "${data.aws_caller_identity.current_identity.arn}"
        },
        Action   = "kms:*"
        Resource = "*"
      },
      {
        Action = [
          "kms:Decrypt",
          "kms:Encrypt",
          "kms:GenerateDataKey*"
        ],
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Resource = "*",
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = "${var.aws_cloudfront_distribution_arn}"
          }
        }
      },
    ]
    Version = "2012-10-17"
  })
}