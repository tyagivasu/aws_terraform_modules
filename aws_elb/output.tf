output "lb_name" {
  value = "${module.classic_lb.name}"
}
output "elb_dns" {
  value = "${module.classic_lb.dns}"
}
output "elb_id" {
  value = "${module.classic_lb.id}"
}