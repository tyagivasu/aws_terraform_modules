variable "ec2_count" {
  default = "1"
}
variable "ami" {
  default = "ami-07d0cf3af28718ef8"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "wickedvik0"
}
variable "subnet" {}
variable "security_group" {
  default = "sg-028b744b090904160"
}
variable "public_ip" {
  default = "false"
}
variable "tags" {}