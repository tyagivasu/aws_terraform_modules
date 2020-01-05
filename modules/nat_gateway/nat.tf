resource "aws_eip" "natip" {
  vpc = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.natip.id
  subnet_id = var.pub_subnet_id
  tags = {
    Name = "gw NAT"
  }
}

output "ngw_id" {
  value = "${aws_nat_gateway.ngw.id}"
}
