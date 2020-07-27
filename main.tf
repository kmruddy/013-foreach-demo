provider "aws" {
  region = var.aws_region
}

variable "aws_region" {}

variable env_type {
  type    = set(string)
  default = ["dev", "qa", "prod"]
}

module s3_bucket {
  source   = "terraform-aws-modules/s3-bucket/aws"
  for_each = var.env_type

  bucket = "terraform-foreach-${each.key}"
  region = var.aws_region
}
