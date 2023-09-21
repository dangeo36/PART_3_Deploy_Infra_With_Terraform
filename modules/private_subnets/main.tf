// private subnets
resource "aws_subnet" "dg_private_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_3_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "${var.env}-dg_private_subnet_1"
  }
}
resource "aws_subnet" "dg_private_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_4_cidr
  availability_zone = "us-east-1b"
  tags = {
    Name = "${var.env}-dg_private_subnet_2"
  }
}

// secure subnets 

resource "aws_subnet" "dg_secure_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_5_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "${var.env}-dg_secure_subnet_1"
  }
}

resource "aws_subnet" "dg_secure_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_6_cidr
  availability_zone = "us-east-1b"
  tags = {
    Name = "${var.env}-dg_secure_subnet_2"
  }
}

// Route Tables

resource "aws_route_table" "dg_pri_route_1" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.pri_route_cidr
    gateway_id = var.nat_gateway_1
  }
  tags = {
    Name = "${var.env}-pri_route"
  }
}

resource "aws_route_table" "dg_pri_route_2" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.pri_route_cidr
    gateway_id = var.nat_gateway_2
  }
  tags = {
    Name = "${var.env}-pri_route"
  }
}

// Associations 

resource "aws_route_table_association" "dg_pri_route_acsn_1" {
  subnet_id      = aws_subnet.dg_private_subnet_1.id
  route_table_id = aws_route_table.dg_pri_route_1.id
}

resource "aws_route_table_association" "dg_pri_route_acsn_2" {
  subnet_id      = aws_subnet.dg_private_subnet_2.id
  route_table_id = aws_route_table.dg_pri_route_2.id
}


// Outputs
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






