resource "aws_internet_gateway" "dg_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.env}-dg_igw"
  }
}
resource "aws_eip" "dg_nat_gateway_1" {
  domain = "vpc"
}

resource "aws_eip" "dg_nat_gateway_2" {
  domain = "vpc"
}

resource "aws_nat_gateway" "dg_nat_gw_1" {
  allocation_id = aws_eip.dg_nat_gateway_1
  subnet_id     = var.pub_subnet_1
  tags = {
    Name = "${var.env}-nat_gw-subnet_1"
  }
}

resource "aws_nat_gateway" "dg_nat_gw_2" {
  allocation_id = aws_eip.dg_nat_gateway_2
  subnet_id     = var.pub_subnet_2
  tags = {
    Name = "${var.env}-nat_gw-subnet_2"
  }
}

output "dg_igw_output" {
  value = aws_internet_gateway.dg_igw.id
}
output "dg_nat_gw_output_1" {
  value = aws_nat_gateway.dg_nat_gw_1.id
}

output "dg_nat_gw_output_2" {
  value = aws_nat_gateway.dg_nat_gw_2.id
}
