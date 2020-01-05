output "vpc_id" {
  description = "VPC ID"
  value = "${module.my_vpc.vpc_id}"
}

output "igw_id" {
  value = "${module.igw.igw_id}"
} 
output "public_subnet_id" {
  value = "${module.pub_subnet.subnet_id}"
}

output "private_subnet_id" {
  value = "${module.private_subnet.subnet_id}"
}