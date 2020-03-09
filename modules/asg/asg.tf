resource "aws_autoscaling_group" "asg" {
  name = var.name
  max_size = var.max_size
  min_size = var.min_size
  desired_capacity = var.desired
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = var.lc_name
  vpc_zone_identifier       = var.subnets  
  tags = concat(
    var.tags,
  )
  
  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }
}

output "asg_id" {
  description = "launch_configuration id"
  value = "${aws_autoscaling_group.asg.id}"
}