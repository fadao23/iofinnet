# the IF of the current user to be able to manage the kms key
data "aws_caller_identity" "current_identity" {}