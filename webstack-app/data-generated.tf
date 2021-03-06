################################################################
# Latest AMI
################################################################

data "aws_ami" "latest_ami" {
  most_recent = true
  owners      = ["aws-marketplace"]

  #executable_users = ["self"]

  filter {
    name   = "name"
    values = ["CentOS Linux 7*"]
  }
}

data "aws_security_group" "bastion_sg" {
  name = "bastion-sg"
}
