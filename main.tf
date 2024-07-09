provider "aws" {
  region = var.aws_region
}


module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source     = "./modules/eks"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.vpc.vpc_id
}

module "s3" {
  source = "./modules/s3"
}

module "lb" {
  source     = "./modules/lb"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
  sg_id      = module.security-groups.lb_sg_id
}

module "security-groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}