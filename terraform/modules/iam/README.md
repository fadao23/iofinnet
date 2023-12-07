<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_key_policy.cloudfront_kms_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key_policy) | resource |
| [aws_s3_bucket_policy.cloudfront_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_caller_identity.current_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_cloudfront_distribution_arn"></a> [aws\_cloudfront\_distribution\_arn](#input\_aws\_cloudfront\_distribution\_arn) | CloudFront distribution arn | `any` | n/a | yes |
| <a name="input_bucket_encryption_key_id"></a> [bucket\_encryption\_key\_id](#input\_bucket\_encryption\_key\_id) | Bucket encryption key id | `string` | n/a | yes |
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | Id of the bucket | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags of managed resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_kms_key_policy_arn"></a> [aws\_kms\_key\_policy\_arn](#output\_aws\_kms\_key\_policy\_arn) | n/a |
<!-- END_TF_DOCS -->