variable "name" {
  default = "test-vik"
}
variable "ami" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {}
variable "security_groups" {
  default = []
  type = list(string)
}
variable "root_device" {
  description = "Customize details about the root block device of the instance"
  type        = list(map(string))
  default     = []
}
