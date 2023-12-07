resource "random_uuid" "uuid" {}

provider "aws" {
  region = var.region
}

// creation of s3 buckets
module "s3_buckets" {
  source = "./modules/s3"

  for_each = var.buckets

  bucket_name = each.key
  uuid        = random_uuid.uuid.id
  tags        = merge(var.tags, local.tags)
}

// Creating the sample pages
resource "local_file" "generated_html" {
  for_each = var.buckets

  content = templatefile("./templates/index.html.tpl", {
    title   = "You are in the ${each.key} folder",
    message = "This is the bucket ${each.value} in the ${local.tags.env} environnement"
  })
  filename = "./templates/${each.key}.html"
}

// pages
resource "aws_s3_object" "buckets_pages" {
  for_each = var.buckets

  bucket       = module.s3_buckets[each.key].bucket_id
  key          = "${each.value}/index.html"
  content_type = "text/html"
  content      = local_file.generated_html[each.key].content

  tags = merge(var.tags, local.tags)

  depends_on = [module.s3_buckets]
}

// only one origin access controll for all cloudfront instance
resource "aws_cloudfront_origin_access_control" "content_bucket_acl" {
  name                              = "buckets-oac"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
  origin_access_control_origin_type = "s3"
}

// creation of cloud front distributions
module "cloudfront_distributions" {
  for_each = var.buckets

  source                   = "./modules/cloudfront"
  default_root_object      = "${each.value}/index.html"
  bucket_id                = module.s3_buckets[each.key].bucket_id
  origin_access_control_id = aws_cloudfront_origin_access_control.content_bucket_acl.id

  tags = merge(var.tags, local.tags)

  depends_on = [module.s3_buckets, aws_s3_object.buckets_pages]
}

// creating and binding the IAM permissions
module "iam" {
  for_each = var.buckets
  source   = "./modules/iam"

  tags                            = merge(var.tags, local.tags)
  bucket_id                       = module.s3_buckets[each.key].bucket_id
  bucket_encryption_key_id        = module.s3_buckets[each.key].key_encryption_id
  aws_cloudfront_distribution_arn = module.cloudfront_distributions[each.key].cloudfront_distribution_arns

}