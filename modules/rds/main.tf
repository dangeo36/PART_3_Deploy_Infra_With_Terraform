provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "dg-test-sql" {
  instance_class    = "db.t3.micro"
  engine            = "mysql"
  engine_version    = "8.0"
  multi_az          = true
  storage_type      = "gp2"
  allocated_storage = 20
  username                = var.username
  password                = var.password
  apply_immediately       = "true"
  backup_retention_period = 10
  backup_window           = "08:00-08:30"
  db_subnet_group_name    = aws_db_subnet_group.dg-rds-db-subnet.name
  vpc_security_group_ids  = [var.security_group_id]
  skip_final_snapshot     = true
}

resource "aws_db_subnet_group" "dg-rds-db-subnet" {
  name       = "dg-rds-db-subnet"
  subnet_ids = [var.rds_subnet_1, var.rds_subnet_2]
}


output "db_instance_endpoint" {
  value = aws_db_instance.dg-test-sql.endpoint
}
