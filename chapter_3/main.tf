provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = "ap-northeast-2"
}

provider "cloudinit" {
  
}


# network 모듈 생성
module "network" {
  ## module path ##
  source = "./network"

  VPC_CIDR_BLOCK     = var.VPC_CIDR_BLOCK
  MAIN_PUBLIC_1_CIDR = var.MAIN_PUBLIC_1_CIDR
  MAIN_PUBLIC_2_CIDR = var.MAIN_PUBLIC_2_CIDR
  MAIN_PUBLIC_3_CIDR = var.MAIN_PUBLIC_3_CIDR

  MAIN_PRIVATE_1_CIDR = var.MAIN_PRIVATE_1_CIDR
  MAIN_PRIVATE_2_CIDR = var.MAIN_PRIVATE_2_CIDR
  MAIN_PRIVATE_3_CIDR = var.MAIN_PRIVATE_3_CIDR

  MAIN_1_REGION = var.MAIN_1_REGION
  MAIN_2_REGION = var.MAIN_2_REGION
  MAIN_3_REGION = var.MAIN_3_REGION
}

# instance 모듈 생성
module "instace" {
  ## module path ##
  source = "./instance"

  HOME_NETWORK_IP = var.HOME_NETWORK_IP
  MAIN_VPC_ID     = module.network.MAIN_VPC_ID
  AWS_KEY_NAME    = var.AWS_KEY_NAME
  INSTNACE_TYPE   = var.INSTNACE_TYPE

  MAIN_1_PUBLIC_SUBNET_ID  = module.network.MAIN_1_PUBLIC_SUBNET_ID
  MAIN_1_PRIVATE_SUBNET_ID = module.network.MAIN_1_PRIVATE_SUBNET_ID

  VOLUME_AZ   = var.MAIN_1_REGION
  VOLUME_SIZE = var.VOLUME_SIZE
  MAIN_2_REGION = var.MAIN_2_REGION
}