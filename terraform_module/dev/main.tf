provider "aws" {
  region = var.AWS_REGION
}

module "main-vpc" {
  source     = "../modules/vpc"
  ENV        = "dev"
  AWS_REGION = var.AWS_REGION
}

module "instances" {
  source         = "../modules/instance"
  ENV            = "dev"
  VPC_ID         = module.main-vpc.VPC_ID
  public_subnets = module.main-vpc.public_subnets
  AWS_KEY_NAME   = var.AWS_KEY_NAME
}
