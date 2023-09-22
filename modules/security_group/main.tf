// Security Group for EC2

resource "aws_security_group" "dg_pub_sg" {
  name        = "dg_pub_sg"
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_id
  
  dynamic "ingress" {
    for_each = var.ports_ec2
    iterator = myport
    content {
      description = "TLS from VPC"
      from_port   = myport.value
      to_port     = myport.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-pub_sg"
  }
}

// Security Group for ALB

resource "aws_security_group" "dg_sg_alb" {
  name        = "dg_alb_sg"
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ports_alb
    iterator = myport
    content {
      description = "TLS from VPC"
      from_port   = myport.value
      to_port     = myport.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-alb_sg"
  }
}

// Security Group for RDS

resource "aws_security_group" "sec_rds" {
  name        = "sec_rds"
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ports_rds
    iterator = myport
    content {
      description = "TLS from VPC"
      from_port   = myport.value
      to_port     = myport.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-rds"
  }
}

// Outputs

output "dg_ec2_sg_output" {
  value = aws_security_group.dg_pub_sg.id
}

output "dg_alb_sg_output" {
  value = aws_security_group.dg_sg_alb.id
}

output "dg_rds_sg_output" {
  value = aws_security_group.sec_rds.id
}

output "dg_rds_sg_output_name" {
  value = aws_security_group.sec_rds.name
}


