# Terraform project

This is the terraform project. This project provide a CloudFront using S3 as backend. The S3 use versioning and Server-Side-Encryption

## Modules

This terraform project is composed by 3 modules : S3, CloudFront and IAM. Each module provides a modulable configuration that you can set on the main.tf file.

## Variables

This project can works without setting variables as input, on the file variables.tf, some vars are already defined. If you want to change the values, please overide thees vars providing a .tfvars.

## Run the project

This project use terraform workspace to manage the environments. You need to create the envs, by default, terraform will use the "default" workspace.

    terraform workspace new dev

    terraform workspace new staging

    terraform workspace new prod

To select to workspace where we want to deploy :

    terraform workspace select dev

There the commands to be able to run the project.

    terraform init

    terraform plan

    terraform apply

If you want to provide vars :

    terraform plan -var-file="PATH-TO.tfvars"

    terraform apply -var-file="PATH-TO.tfvars"

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.29.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudfront_distributions"></a> [cloudfront\_distributions](#module\_cloudfront\_distributions) | ./modules/cloudfront | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/iam | n/a |
| <a name="module_s3_buckets"></a> [s3\_buckets](#module\_s3\_buckets) | ./modules/s3 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_origin_access_control.content_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |
| [aws_s3_object.buckets_pages](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [local_file.generated_html](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_uuid.uuid](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_buckets"></a> [buckets](#input\_buckets) | Map of folder and bucket name | `map(string)` | <pre>{<br>  "auth": "bucket1",<br>  "customers": "bucket3",<br>  "info": "bucket2"<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS Region to use, default is eu-west-1 | `string` | `"eu-west-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for managed resources | `map(string)` | <pre>{<br>  "managed-by": "terraform"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudfront_url"></a> [cloudfront\_url](#output\_cloudfront\_url) | n/a |
<!-- END_TF_DOCS -->