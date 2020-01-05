resource "aws_elb_attachment" "this" {
  elb      = var.lb_id
  instance = var.instance
}