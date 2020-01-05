variable "vpc_id" {}

variable "private_subnet_cidr" {
  description = "CIDR PRIVATE SUBNET"
  default = "172.16.20.0/24"
}

variable "az" {
  description = "availability zone"
  default = "us-east-1a"
}

variable "private_rt" {}