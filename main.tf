terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.1.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "dg-bucket-3-tf"             
    key            = "default/terraform.tfstate" 
    region         = "us-east-1"                
    encrypt        = "true"
  }
}
resource "aws_s3_bucket" "dg_bucket" {
  bucket = "dg-bucket-3-tf"
}


provider "aws" {
  region = var.region
}


// Resources in Modules 
module "igw_nat" {
  source       = "./modules/igw_nat"
  env          = var.env
  vpc_id       = module.vpc.dg_vpc_output
  pub_subnet_1 = module.public_subnets.dg_public_subnet_output_1
  pub_subnet_2 = module.public_subnets.dg_public_subnet_output_2
}

module "vpc" {
  source = "./modules/vpc"
  env = var.env
  vpc_cidr_block = var.vpc_cidr_block
}

module "public_subnets" {
  source         = "./modules/public_subnets"
  env            = var.env
  vpc_cidr_block = var.vpc_cidr_block
  pub_route_cidr = var.pub_route_cidr
  subnet_1_cidr  = var.subnet_1_cidr
  subnet_2_cidr  = var.subnet_2_cidr
  vpc_id         = module.vpc.dg_vpc_output
  int_gateway    = module.igw_nat.dg_igw_output
}

module "private_subnets" {
  source         = "./modules/private_subnets"
  env            = var.env
  vpc_cidr_block = var.vpc_cidr_block
  pri_route_cidr = var.pri_route_cidr
  subnet_3_cidr  = var.subnet_3_cidr
  subnet_4_cidr  = var.subnet_4_cidr
  subnet_5_cidr  = var.subnet_5_cidr
  subnet_6_cidr  = var.subnet_6_cidr
  vpc_id         = module.vpc.dg_vpc_output
  nat_gateway_1  = module.igw_nat.dg_nat_gw_output_1
  nat_gateway_2  = module.igw_nat.dg_nat_gw_output_2
}

module "web_server" {
  source        = "./modules/web_server"
  env           = var.env
  public_key    = var.public_key
  ami           = var.ami
  instance_type = var.instance_type
  subnet_1_app  = module.private_subnets.dg_private_subnet_output_1
  subnet_2_app  = module.private_subnets.dg_private_subnet_output_2
  security_group_web = module.security_group.dg_ec2_sg_output
  iam_profile        = module.iam_role.instance_profile
  awsrds_endpoint    = module.rds.db_instance_endpoint
  username           = var.username
  password           = var.password
  root_password      = var.root_password
  depends_on         = [module.rds]
}

module "security_group" {
  source     = "./modules/security_group"
  vpc_id     = module.vpc.dg_vpc_output
  env        = var.env
  ports_ec2  = var.ports_ec2
  ports_alb  = var.ports_alb
  ports_rds  = var.ports_rds
}

module "rds" {
  source            = "./modules/rds"
  username          = var.username
  password          = var.password
  security_group_id = module.security_group.dg_rds_sg_output
  rds_subnet_1       = module.private_subnets.dg_secure_subnet_output_1
  rds_subnet_2       = module.private_subnets.dg_secure_subnet_output_2
  vpc_id = module.vpc.dg_vpc_output

}

module "iam_role" {
  source     = "./modules/iam_role"
  env        = var.env
}


