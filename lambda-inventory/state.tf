terraform {
  backend "s3" {
    bucket  = "webstack-890090367563"
    key     = "dev/lambda/terraform.tfstate"
    region  = "us-west-2"
    profile = "aws-personal-rmathi"
    encrypt = true
  }

  required_version = "~> 0.11.0"
}
