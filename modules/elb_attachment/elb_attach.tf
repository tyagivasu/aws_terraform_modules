resource "aws_elb_attachment" "this" {
  count = length(var.instance)
  elb      = var.elb
  instance = element(var.instance,count.index)
}