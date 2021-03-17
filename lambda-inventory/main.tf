provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

#--------------------------------------------------------------
# Lambda
#--------------------------------------------------------------

module "lambda_inventory" {
  source = "git@github.com:MathialaganR/terraform-lambda-trmb.git?ref=1.0.0"

  #source = "../../terraform-lambda-trmb/"

  function_name     = "ec2inventory_lambda_tf"
  handler_name      = "lambda_function.lambda_handler"
  subnet_ids        = ["subnet-01e692f7ef810aa5d", "subnet-0836aca4f46d9cbd0"]
  security_group_id = ["sg-0c72f378e687cd39d"]
}
