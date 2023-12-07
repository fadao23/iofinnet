output "bucket_id" {
  value = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "key_encryption_id" {
  value = aws_kms_key.key_encryption.id
}