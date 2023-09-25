variable "env" {}
variable "public_key" {}
variable "ami" {}
variable "instance_type" {}
# variable "security_group_web" {}
variable "security_groups" {
  description = "List of security group IDs to associate with the instance."
  type        = list(string)
}
variable "subnet_1_app" {}
variable "subnet_2_app" {}
variable "iam_profile" {}
variable "awsrds_endpoint" {}
variable "username" {}
variable "password" {}
variable "root_password" {}
