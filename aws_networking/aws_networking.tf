provider "aws" {
	region = "us-east-1"
}

module "my_vpc" {
	source = "../modules/vpc"
  vpc_cidr = "172.16.0.0/16"
}

module "igw" {
  source = "../modules/igw"
  vpc_id = "${module.my_vpc.vpc_id}"
}

module "nat" {
  source = "../modules/nat_gateway"
  pub_subnet_id = "${module.pub_subnet.subnet_id}"
}

module "rt" {
  source = "../modules/route_table"
  vpc_id = "${module.my_vpc.vpc_id}"
  igw = "${module.igw.igw_id}"
  ngw_id = "${module.nat.ngw_id}"
}

module "private_subnet" {
  source = "../modules/private_subnet"
  vpc_id = "${module.my_vpc.vpc_id}"
  private_rt = "${module.rt.private_rt}"
}

module "pub_subnet" {
  source = "../modules/pub_subnet"
  vpc_id = "${module.my_vpc.vpc_id}"
  public_rt = "${module.rt.public_rt}"
}