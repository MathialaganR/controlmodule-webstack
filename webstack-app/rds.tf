resource "aws_ssm_parameter" "webstack_rds_password" {
  name        = "/${var.global_product}/${var.global_environment}/db/oracle/password"
  description = "The parameter description"
  type        = "SecureString"
  value       = "${random_password.webstack_gen_password.result}"

  tags = {
    environment = "${var.global_environment}"
  }
}

resource "random_password" "webstack_gen_password" {
  length = 16
  special = true
  override_special = "_%@"
}

module "webstack-rds" {
  source = "git@github.com:MathialaganR/terraform-rds-trmb.git"

  apps                      = "${var.global_product}"
  business_unit             = "${var.businessunit}"
  database_name             = "webstack"
  database_user             = "rds_admin"
  database_password         = "${aws_ssm_parameter.webstack_rds_password.value}"
  db_parameter_group_family = "mysql5.7"
  db_parameter_group_name   = "default.mysql5.7"
  cidr_blocks               = "10.0.0.0/8"
  global_vpc_id         = "${var.global_vpc_id}"
  global_environment    = "dev"
  global_product        = "${var.global_product}"
  license_model         = "mysql-license"
  private_subnets       = "${var.private_subnets}"
  rds_allocated_storage = "10"
  rds_engine_type       = "mysql"
  rds_engine_version    = "5.7"
  rds_instance_basename = "webstack"
  rds_instance_class    = "db.t3.micro"
  rds_storage_type      = "gp2"
  skip_final_snapshot   = "false"
  db_port               = "3306"
  db_protocol           = "tcp"
  trusted_sg            = "sg-0f662f5160b0d21a3"
  route53_required  = "false"
  global_costcentre = "${var.global_costcode}"

}