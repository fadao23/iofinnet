variable "bucket_id" {
  type        = string
  description = "Id of the bucket"
}

variable "default_root_object" {
  type        = string
  description = "The root of the default object in the bucket"
  default     = "index.html"
}

variable "origin_access_control_id" {
  type        = string
  description = "Origin Access Control identification"
}

variable "tags" {
  type        = map(string)
  description = "Tags for managed resources"
}