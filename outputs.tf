# // IG NATGW
# output "dg_igw_output" {
#   value = aws_internet_gateway.dg_igw.id
# }
# output "dg_nat_gw_output1" {
#   value = aws_nat_gateway.dg_nat_gw_1.id
# }

# output "dg_nat_gw_output2" {
#   value = aws_nat_gateway.dg_nat_gw_2.id
# }

# // VPC

# output "dg_vpc_output" {
#   value = aws_vpc.dg_vpc.id
# }

# // Public Subnets 1 and 2 
# output "dg_public_subnet_output_1" {
#   value = aws_subnet.dg_public_subnet_1.id
# }

# output "dg_public_subnet_output_2" {
#   value = aws_subnet.dg_public_subnet_2.id
# }

# // Public Route Table 
# output "dg_pub_route_output" {
#   value = aws_route_table.dg_pub_route.id
# }

# // Private and Secure Subnets

# output "dg_private_subnet_output_1" {
#   value = aws_subnet.dg_private_subnet_1.id
# }

# output "dg_private_subnet_output_2" {
#   value = aws_subnet.dg_private_subnet_2.id
# }

# output "dg_secure_subnet_output_1" {
#   value = aws_subnet.dg_secure_subnet_1.id
# }

# output "dg_secure_subnet_output_2" {
#   value = aws_subnet.dg_secure_subnet_2.id
# }

# // Private EC2 instances 
# output "private_instance_1" {
#   value = aws_instance.dg_server_1.id
# }

# output "private_instance_2" {
#   value = aws_instance.dg_server_2.id
# }

# output "key" {
#   value = aws_key_pair.petclinic_key.key_name
# }

# // Security Groups

# output "dg_ec2_sg_output" {
#   value = aws_security_group.dg_pub_sg.id
# }

# output "dg_alb_sg_output" {
#   value = aws_security_group.dg_sg_alb.id
# }

# output "dg_rds_sg_output" {
#   value = aws_security_group.sec_rds.id
# }

# output "dg_rds_sg_output_name" {
#   value = aws_security_group.sec_rds.name
# }

# // RDS

# output "db_instance_endpoint" {
#   value = aws_db_instance.dg-test-sql.endpoint
# }


# // IAM

# output "instance_profile" {
#   value = aws_iam_instance_profile.dg-instance-profile.name
# }

# output "instance_profile_arn" {
#   value = aws_iam_instance_profile.dg-instance-profile.arn
# }