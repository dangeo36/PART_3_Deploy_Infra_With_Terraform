terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.1.0"
    }
  }
}

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

