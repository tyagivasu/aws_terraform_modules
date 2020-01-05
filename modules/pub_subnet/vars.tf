variable "vpc_id" {}

variable "public_subnet_cidr" {
  description = "CIDR PUBLIC SUBNET"
  default = "172.16.10.0/24"
}

variable "az" {
  description = "availability zone"
  default = "us-east-1a"
}

variable "public_rt" {}