output "cloudfront_distribution_arns" {
  value = aws_cloudfront_distribution.cloudfront.arn
}

output "cloudfront_distribution_url" {
  value = aws_cloudfront_distribution.cloudfront.domain_name
}