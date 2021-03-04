terraform {
  backend "s3" {
    bucket  = "webstack-890090367563"
    key     = "dev/app/terraform.tfstate"
    region  = "us-west-2"
    profile = "aws-personal-rmathi"
  }
}
