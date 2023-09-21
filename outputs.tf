// IG NATGW
output "dg_igw_output" {
  value = aws_internet_gateway.dg_igw.id
}
output "dg_nat_gw_output1" {
  value = aws_nat_gateway.dg_nat_gw_1.id
}

output "dg_nat_gw_output2" {
  value = aws_nat_gateway.dg_nat_gw_2.id
}

// VPC

output "dg_vpc_output" {
  value = aws_vpc.dg_vpc.id
}

// Public Subnets 1 and 2 
output "dg_public_subnet_output_1" {
  value = aws_subnet.dg_public_subnet_1.id
}

output "dg_public_subnet_output_2" {
  value = aws_subnet.dg_public_subnet_2.id
}

// Public Route Table 
output "dg_pub_route_output" {
  value = aws_route_table.dg_pub_route.id
}

// Private and Secure Subnets

output "dg_private_subnet_output_1" {
  value = aws_subnet.dg_private_subnet_1.id
}

output "dg_private_subnet_output_2" {
  value = aws_subnet.dg_private_subnet_2.id
}

output "dg_secure_subnet_output_1" {
  value = aws_subnet.dg_secure_subnet_1.id
}

output "dg_secure_subnet_output_2" {
  value = aws_subnet.dg_secure_subnet_2.id
}



