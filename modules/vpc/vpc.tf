resource "aws_vpc" "test" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "testVPC"
  }
}

output "vpc_id" {
	description = "VPC"
	value = "${aws_vpc.test.id}"
}
