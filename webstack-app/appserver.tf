provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

#--------------------------------------------------------------
# Webstack Server
#--------------------------------------------------------------

module "webstack" {
  source = "git@github.com:MathialaganR/terraform-webstack-trmb.git"

  ec2_hostrecord      = "webstackserver"
  ec2_instance_type   = "t2.nano"
  ec2_rootvol_size    = "20"
  global_key_name     = "rmathiaws"
  cidr_blocks         = "${var.cidr_blocks}"
  alb_cidr_blocks     = "0.0.0.0/0"
  alb_subnets         = "${var.public_subnets}"
  global_vpc_id       = "${var.global_vpc_id}"
  global_costcode     = "${var.global_costcode}"
  ec2_ami             = "${data.aws_ami.latest_ami.id}"
  global_businessunit = "fin"
  global_subnet_id    = "${var.private_subnets}"
  global_product      = "${var.global_product}"
  global_environment  = "dev"
  ec2_role            = "${var.ec2_role}"
  orchestration       = "${var.global_orchestration}"
  listener_lb_port    = "443"
  idle_timeout        = "10"
  ec2_user_data       = "userdata.sh"
  ssl_cert_arn        = "arn:aws:acm:us-west-2:890090367563:certificate/aead5df3-b94f-4185-b9ef-dda55d120f41"
  tag_product         = "${var.global_product}"
  deployed_service    = "${var.ec2_role}"
}
