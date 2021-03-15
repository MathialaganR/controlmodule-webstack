provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

#--------------------------------------------------------------
# Lambda
#--------------------------------------------------------------

module "lambda_inventory" {
  #source = "git@github.com:MathialaganR/terraform-lambda-trmb.git"

  source = "../../terraform-lambda-trmb/"

  function_name = "ec2inventory_lambda_tf"
  handler_name  = "ec2inventory_lambdahandler_tf"
  subnet_ids    = ["subnet-0a06d640","subnet-67fa4c1f"]
  security_group_id = ["sg-9585e1ac"]

}

