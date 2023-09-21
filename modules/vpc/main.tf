resource "aws_vpc" "dg_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = "default"
  tags = {
    Name = "{var.env}--dg_vpc"
  } 
}

output "dg_vpc_output" {
  value = aws_vpc.dg_vpc.id
}