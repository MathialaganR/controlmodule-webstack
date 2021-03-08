#Common Information
aws_region = "us-west-2"
aws_profile = "aws-personal-rmathi"
account_id = "890090367563"
global_product = "webstack"
global_environment = "dev"
ec2_role = "app"
global_costcode = "123456"
cidr_blocks = "10.0.0.0/8"
public_subnets = "subnet-9af2cbb1,subnet-67fa4c1f"
global_vpc_id = "vpc-a95174d1"
private_subnets = "subnet-0a06d640,subnet-f9bd3ca4"
global_orchestration = "git@github.com:MathialaganR/terraform-webstack-trmb.git"
businessunit = "fin"
availability_zones = "us-west-2a,us-west-2b"
alb_cidr_blocks = "0.0.0.0/0"
#Instance Information
global_key_name = "rmathiaws"
ec2_instance_type = "t2.nano"
ec2_hostrecord = "webstackserver"
ec2_rootvol_size = "20"
listener_lb_port = "443"
idle_timeout = "10"
ssl_cert_arn = "arn:aws:acm:us-west-2:890090367563:certificate/cf7289df-6d25-46b5-adea-5d1f3d24d92b"
global_phz_id = "Z03864231F5248D2M0CKW"
ec2_alb_cname = "webstack"
#RDS Information
database_name = "webstack"
rds_allocated_storage = "10"