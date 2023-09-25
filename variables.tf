// VPC vars
variable "region" {}

variable "instance_type" {}
variable "env" {}
variable "vpc_cidr_block" {}

variable "pub_route_cidr" {}
variable "pri_route_cidr" {}

variable "ami" {}

variable "ports_ec2" {
  type = list(number)
}

variable "ports_alb" {
  type = list(number)
}

variable "ports_rds" {
  type = list(number)
}


variable "public_key" {}

variable "subnet_1_cidr" {}
variable "subnet_2_cidr" {}

variable "subnet_3_cidr" {}
variable "subnet_4_cidr" {}


variable "subnet_5_cidr" {}
variable "subnet_6_cidr" {}

variable "username" {}
variable "password" {}
variable "root_password" {}

variable "security_groups" {
  description = "List of security group IDs to associate with the instance."
  type        = list(string)
}
