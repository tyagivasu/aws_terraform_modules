provider "aws" {
  region = "us-east-1"
  version = ">=0.12.8"
  profile = var.profile
  shared_credential_file = var.creds
}

locals {
  common_tags = "${map(
    "cms-service", "test-service",
    "cms-service-type", "microservice",
    "cms-enviornment", "int"
  )}"
}

module "ec2_instance" {
  source = "github.com/vasu04/aws_terraform_modules/modules/ec2"
  subnet = ""
  security_group = ""
  public_ip = "false"
  ec2_count = "2"
  instance_type = "t2.micro"
  tags = local.common_tags
  key_name = ""
  ami = ""
}

module "classic_lb" {
  source = "github.com/vasu04/aws_terraform_modules/modules/elb"
  lb_name = "test-lb"
  target_health = "HTTP:80/test/version"
  lb_security_group = ""
  subnet_id = ""
  #instances = module.ec2_instance.instance_ids
  tags = local.common_tags
}

module "lb_attachment" {
  source = "github.com/vasu04/aws_terraform_modules/modules/elb_attachment"
  elb = module.classic_lb.name
  instance = module.ec2_instance.instance_ids
}
