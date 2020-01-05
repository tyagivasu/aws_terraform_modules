provider "aws" {
        region = "us-east-1"
}

module "classic_lb" {
  source = "../modules/elb"
  lb_name = "test-lb"
  target_health = "HTTP:80/test/version"
  lb_security_group = "sg-028b744b090904160"
  subnet_id = "subnet-0e4a503e4c4483dbb"
}