resource "aws_elb" "clb" {
  name = var.lb_name
  security_groups = [var.lb_security_group]
  subnets = [var.subnet_id]
  internal = var.internal

  listener {
    instance_port     = var.instance_port
    instance_protocol = var.instance_protocol
    lb_port           = var.lb_port
    lb_protocol       = var.lb_protocol
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = var.target_health
    interval            = 30
  }
  #instances = var.instances
  cross_zone_load_balancing   = true
  idle_timeout                = 300
  connection_draining         = true
  connection_draining_timeout = 300

  tags = var.tags
  lifecycle {
    ignore_changes = ["name"]
  }
}

output "id" {
  value = "${aws_elb.clb.id}"
}
output "name" {
  value = "${aws_elb.clb.name}"
}
output "dns" {
  value = "${aws_elb.clb.dns_name}"
}