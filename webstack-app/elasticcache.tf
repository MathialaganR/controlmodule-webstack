resource "random_string" "auth_token" {
  length  = 64
  special = false
}

module "webstack_redis" {
  source = "git@github.com:MathialaganR/terraform-elasticcache-trmb.git"

  namespace          = "general"
  name               = "redis"
  stage              = "dev"
  security_groups    = ["${module.webstack.ec2_sg_id}", "${data.aws_security_group.bastion_sg.id}"]
  auth_token         = "${random_string.auth_token.result}"
  vpc_id             = "${var.global_vpc_id}"
  subnets            = ["subnet-0a06d640", "subnet-f9bd3ca4"]
  maintenance_window = "wed:03:00-wed:04:00"
  cluster_size       = "1"
  instance_type      = "cache.t2.micro"
  engine_version     = "4.0.10"
  apply_immediately  = "true"
  availability_zones = ["us-west-2a", "us-west-2b"]
  automatic_failover = "false"
}

output "auth_token" {
  value = "${random_string.auth_token.result}"
}
