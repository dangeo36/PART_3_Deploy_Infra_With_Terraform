resource "aws_key_pair" "petclinic_key" {
  key_name   = "petclinic-key"
  public_key = var.public_key
}

resource "aws_instance" "dg_server_1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_1_app
  key_name      = aws_key_pair.petclinic_key.key_name
  user_data = templatefile("${path.module}/templates/instance_init.tpl", {
    ENDPOINT       = var.awsrds_endpoint
    MYSQL_USERNAME = var.username
    MYSQL_PASSWORD = var.password
    ROOT_PASSWORD  = var.root_password
  })
  associate_public_ip_address = false
  # vpc_security_group_ids      = [var.security_group_web, module.security_group.dg_alb_sg_output]
  vpc_security_group_ids   = var.security_groups
  iam_instance_profile        = var.iam_profile
  tags = {
    Name = "${var.env}-dg-app-1"
  }
}

resource "aws_instance" "dg_server_2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_2_app
  key_name      = aws_key_pair.petclinic_key.key_name
  user_data = templatefile("${path.module}/templates/instance_init.tpl", {
    ENDPOINT       = var.awsrds_endpoint
    MYSQL_USERNAME = var.username
    MYSQL_PASSWORD = var.password
    ROOT_PASSWORD  = var.root_password
  })
  associate_public_ip_address = false
  # vpc_security_group_ids      = [var.security_group_web, module.security_group.dg_alb_sg_output]
  # vpc_security_group_ids      = [module.security_group.dg_ec2_sg_output, module.security_group.dg_alb_sg_output]
  vpc_security_group_ids   = var.security_groups
  iam_instance_profile        = var.iam_profile
  tags = {
    Name = "${var.env}-dg-app-2"
  }
}

output "private_instance_1" {
  value = aws_instance.dg_server_1.id
}

output "private_instance_2" {
  value = aws_instance.dg_server_2.id
}

output "key" {
  value = aws_key_pair.petclinic_key.key_name
}


