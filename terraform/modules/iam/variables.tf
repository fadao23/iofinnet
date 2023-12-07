variable "bucket_id" {
  type        = string
  description = "Id of the bucket"
}

variable "bucket_encryption_key_id" {
  type        = string
  description = "Bucket encryption key id"
}

variable "aws_cloudfront_distribution_arn" {
  type        = any
  description = "CloudFront distribution arn"
}

variable "tags" {
  type        = map(string)
  description = "Tags of managed resources"
}