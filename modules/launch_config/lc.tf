resource "aws_launch_configuration" "lc" {
  name_prefix   = var.name
  image_id      = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = var.security_groups
  ebs_block_device {
     delete_on_termination = true
     device_name = "/dev/xvdz"
     volume_size = "30"
     volume_type = "gp2"
  }
  
  root_block_device {
      delete_on_termination = true
      volume_size = "20"
      volume_type = "gp2"
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "lc_name" {
  description = "launch_configuration name"
  value = "${aws_launch_configuration.lc.name}"
 
}
output "lc_id" {
  description = "launch configuration id"
  value = "${aws_launch_configuration.lc.id}"
}
