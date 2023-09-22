// public subnets

resource "aws_subnet" "dg_public_subnet_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_1_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-dg_public_subnet_1"
  }
}

resource "aws_subnet" "dg_public_subnet_2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_2_cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-dg_public_subnet_2"
  }
}

// Route Table
resource "aws_route_table" "dg_pub_route" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.pub_route_cidr
    gateway_id = var.int_gateway
  }
  tags = {
    Name = "${var.env}-dg_pub_route_1"
  }
}

// Associations
resource "aws_route_table_association" "dg_pub_route_acsn_1" {
  subnet_id      = aws_subnet.dg_public_subnet_1.id
  route_table_id = aws_route_table.dg_pub_route.id
}

resource "aws_route_table_association" "dg_pub_route_acsn_2" {
  subnet_id      = aws_subnet.dg_public_subnet_2.id
  route_table_id = aws_route_table.dg_pub_route.id
}

// Outputs 
output "dg_public_subnet_output_1" {
  value = aws_subnet.dg_public_subnet_1.id
}

output "dg_public_subnet_output_2" {
  value = aws_subnet.dg_public_subnet_2.id
}

output "dg_pub_route_output" {
  value = aws_route_table.dg_pub_route.id
}

