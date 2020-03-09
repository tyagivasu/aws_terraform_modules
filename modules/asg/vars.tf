variable "max_size" {
 default = "2"
}
variable "min_size" {
 default = "1"
}
variable "desired" {
 default = "1"
}
variable "lc_name" {}

variable "subnets" {}
variable "name" {
 default = "testing"
}
variable "tags" {
  type        = list(map(string))
  default     = []
}