resource "aws_route_table" "testR" {
  vpc_id = var.vpc_id
  route { 
    cidr_block = var.cidr
    gateway_id = var.igw
  }
  tags = {
    Name = "PUBLIC Subnet RT"
  }

}

resource "aws_route_table" "testPrivateRT" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.cidr
    nat_gateway_id = var.ngw_id
  }
  tags = {
    Name = "PRIVATE Subnet RT"
  }

}

output "public_rt" {
  value = "${aws_route_table.testR.id}"
}

output "private_rt" {
  value = "${aws_route_table.testPrivateRT.id}"
}
