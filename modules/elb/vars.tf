variable "lb_name" {}
#variable "az" {
#  default = "us-east-1a"
#}
variable "lb_security_group" {}
variable "subnet_id" {}
variable "internal" {
  default = "true"
}
variable "instance_port" {
  default = "80"
}
variable "instance_protocol" {
  default = "http"
}
variable "lb_port" {
  default = "80"
}
variable "lb_protocol" {
  default = "http"
}
variable "target_health" {}
#variable "instances" {}
variable "tags" {}