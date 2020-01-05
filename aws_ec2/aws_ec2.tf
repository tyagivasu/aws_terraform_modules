provider "aws" {
        region = "us-east-1"
}

module "ec2_instance" {
  source = "../modules/ec2"
  subnet = "subnet-0e2bdb6a1767e108c"
  security_group = "sg-028b744b090904160"
  public_ip = "false"
  ec2_count = "1"
  instance_type = "t2.micro"
}