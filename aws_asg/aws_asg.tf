provider "aws" {
  region = "us-east-1"
  version = ">=0.12.8"
}

locals {
  common_tags = "${map(
    "cms-service", "testservice",
    "cms-service-type", "microservice",
    "cms-enviornment", "int"
  )}"
}

module "launch_config" {
  source = "../modules/launch_config"
  security_groups = ["sg-id"]
  ami = "ami-id"
  key_name = ""
  instance_type = "t2.small"
  name = join("-", ["${local.common_tags.cms-enviornment}", "${local.common_tags.cms-service}", "${var.build_number}"])
}

module "asg" {
  source = "../modules/asg"
  name = "${module.launch_config.lc_name}-asg"
  lc_name = module.launch_config.lc_name
  subnets = ["subnet-1", "subnet-2"]
  tags = [
   {
     key                 = "cms-service"
     value               = local.common_tags.cms-service
     propagate_at_launch = true
   },
   {
     key                 = "cms-service-type"
     value               = local.common_tags.cms-service-type
     propagate_at_launch = true
   },
   {
     key                 = "cms-enviornment"
     value               = local.common_tags.cms-enviornment
     propagate_at_launch = true
   },
   {
     key = "Name"
     value = join("-", ["${local.common_tags.cms-enviornment}", "${local.common_tags.cms-service}", "${local.common_tags.cms-service-type}"])
     propagate_at_launch = true
   },
  ]
}

module "classic_lb" {
  source = "github.com/vasu04/aws_terraform_modules/modules/elb"
  lb_name = join("-", ["${local.common_tags.cms-enviornment}", "${local.common_tags.cms-service}", "elb"])
  target_health = "HTTP:80/test/version"
  lb_security_group = "sg-id"
  subnet_id = "subnet-id"
  tags = local.common_tags
}

module "lb_attachment" {
  source = "../modules/attach_asg_elb"
  elb = module.classic_lb.name
  asg = module.asg.asg_id
}

