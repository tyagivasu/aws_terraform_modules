resource "aws_instance" "ec2" {
  count = var.ec2_count
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet
  vpc_security_group_ids = [var.security_group]
  associate_public_ip_address = var.public_ip
  source_dest_check = false
  tags = {
    Name = "TestEC2"
  }
}

#output "instance_ids" {
#  description = "ec2 details"
#  value = ["${aws_instance.ec2.*.id}", "${aws_instance.ec2.*.public_ip}", "${aws_instance.ec2.*.private_ip}"]
#}

output "instance_ids" {
  description = "instance ids"
  value = "${aws_instance.ec2.*.id}"
}