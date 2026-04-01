module "vpc" {
  source = "./modules/vpc"
  cidr = "10.0.0.0/16"
}

module "rds" {
  source          = "./modules/rds"
  private_subnets = module.vpc.private_subnets
}

module "ec2" {
  source          = "./modules/ec2"
  private_subnets = module.vpc.private_subnets
  db_endpoint     = module.rds.endpoint
  target_group_arn  = module.alb.target_group_arn
  vpc_id            = module.vpc.vpc_id 
  alb_sg_id         = module.alb.alb_sg_id
}

module "alb" {
  source         = "./modules/alb"
  public_subnets = module.vpc.public_subnets
  vpc_id         = module.vpc.vpc_id
}
