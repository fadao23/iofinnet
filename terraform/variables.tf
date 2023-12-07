variable "region" {
  type        = string
  description = "The AWS Region to use, default is eu-west-1"
  default     = "eu-west-1"
}

variable "buckets" {
  type        = map(string)
  description = "Map of folder and bucket name"
  default = {
    auth      = "bucket1"
    info      = "bucket2"
    customers = "bucket3"
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags for managed resources"
  default = {
    "managed-by" = "terraform"
  }
}