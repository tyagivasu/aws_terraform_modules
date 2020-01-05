resource "aws_subnet" "private_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.az
  tags = {
    Name = "testPRIVATE Subnet"
  }
}

resource "aws_route_table_association" "private-rt" {
  subnet_id = aws_subnet.private_subnet.id
  route_table_id = var.private_rt
}

output "subnet_id" {
  description = "Private Subnet ID"
  value = "${aws_subnet.private_subnet.id}"
}