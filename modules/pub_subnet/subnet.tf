resource "aws_subnet" "pub_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.az
  tags = {
    Name = "testPUBLIC Subnet" 
  }
}

resource "aws_route_table_association" "pub-rt" {
  subnet_id = aws_subnet.pub_subnet.id
  route_table_id = var.public_rt
}

output "subnet_id" {
  description = "Public Subnet ID"
  value = "${aws_subnet.pub_subnet.id}"
}
