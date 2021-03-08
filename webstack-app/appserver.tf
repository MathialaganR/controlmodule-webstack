provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

#--------------------------------------------------------------
# Webstack Server
#--------------------------------------------------------------

module "webstack" {
  source = "git@github.com:MathialaganR/terraform-webstack-trmb.git?ref=1.0.1"

  ec2_hostrecord      = "${var.ec2_hostrecord}"
  ec2_instance_type   = "${var.ec2_instance_type}"
  ec2_rootvol_size    = "${var.ec2_rootvol_size}"
  global_key_name     = "${var.global_key_name}"
  cidr_blocks         = "${var.cidr_blocks}"
  alb_cidr_blocks     = "${var.alb_cidr_blocks}"
  alb_subnets         = "${var.public_subnets}"
  global_vpc_id       = "${var.global_vpc_id}"
  global_costcode     = "${var.global_costcode}"
  ec2_ami             = "${data.aws_ami.latest_ami.id}"
  global_businessunit = "${var.businessunit}"
  global_subnet_id    = "${var.private_subnets}"
  global_product      = "${var.global_product}"
  global_environment  = "${var.global_environment}"
  ec2_role            = "${var.ec2_role}"
  orchestration       = "${var.global_orchestration}"
  listener_lb_port    = "${var.listener_lb_port}"
  idle_timeout        = "${var.idle_timeout}"
  ec2_user_data       = "userdata.sh"
  ssl_cert_arn        = "${var.ssl_cert_arn}"
  tag_product         = "${var.global_product}"
  deployed_service    = "${var.ec2_role}"
  global_phz_id       = "${var.global_phz_id}"
  ec2_alb_cname       = "${var.ec2_alb_cname}"
}
