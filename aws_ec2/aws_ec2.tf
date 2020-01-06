provider "aws" {
  region = "us-east-1"
  version = ">=0.12.8"
}

locals {
  common_tags = "${map(
    "cms-service", "test-service",
    "cms-service-type", "microservice",
    "cms-enviornment", "int"
  )}"
}

module "ec2_instance" {
  source = "../modules/ec2"
  subnet = "subnet-0e2bdb6a1767e108c"
  security_group = "sg-028b744b090904160"
  public_ip = "false"
  ec2_count = "3"
  instance_type = "t2.micro"
  tags = local.common_tags
}

module "classic_lb" {
  source = "../modules/elb"
  lb_name = "test-lb"
  target_health = "HTTP:80/test/version"
  lb_security_group = "sg-028b744b090904160"
  subnet_id = "subnet-0e4a503e4c4483dbb"
  #instances = module.ec2_instance.instance_ids
  tags = local.common_tags
}

module "lb_attachment" {
  source = "../modules/elb_attachment"
  elb = module.classic_lb.name
  instance = module.ec2_instance.instance_ids
}