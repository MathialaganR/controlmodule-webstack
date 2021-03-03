provider "aws" {
  profile             = "${var.aws_profile}"
  region              = "${var.aws_region}"
  allowed_account_ids = ["${var.account_id}"]
  version             = "~> 1.6"
}


module "vpc" {
  source = "../../terraform-aws-vpc-terraform011"

  name = "my-webstack-vpc"
  cidr = "10.0.0.0/22"


  azs             = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.0.0.0/24", "10.0.1.0/24"]
  public_subnets  = ["10.0.2.0/24", "10.0.3.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"

  }
}