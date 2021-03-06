resource "random_string" "auth_token" {
  length  = 64
  special = false
}

module "webstack_redis" {
  source = "git@github.com:MathialaganR/terraform-elasticcache-trmb.git?ref=1.0.3"

  namespace           = "general"
  name                = "redis"
  stage               = "dev"
  security_groups     = ["${module.webstack.ec2_sg_id}", "${data.aws_security_group.bastion_sg.id}"]
  auth_token          = "${random_string.auth_token.result}"
  vpc_id              = "${var.global_vpc_id}"
  subnets             = ["subnet-0f769c9d30adcbc0a", "subnet-0904012549e743503"]
  maintenance_window  = "wed:03:00-wed:04:00"
  cluster_size        = "1"
  instance_type       = "cache.t2.micro"
  engine_version      = "4.0.10"
  apply_immediately   = "true"
  availability_zones  = ["us-west-2a", "us-west-2b"]
  automatic_failover  = "false"
  global_phz_id       = "Z03864231F5248D2M0CKW"
  elasticache_route53 = "webstackec"
  route53_required    = "true"
}

output "auth_token" {
  value = "${random_string.auth_token.result}"
}
