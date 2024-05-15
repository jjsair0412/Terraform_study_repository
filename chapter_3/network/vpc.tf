# vpc
resource "aws_vpc" "main" {
  cidr_block         = var.VPC_CIDR_BLOCK
  instance_tenancy   = "default"
  enable_dns_support = true

  tags = {
    Name = "main"
  }
}

# subnet
## ======= public subnet ======= ##
resource "aws_subnet" "main_public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.MAIN_PUBLIC_1_CIDR
  map_public_ip_on_launch = true
  availability_zone       = var.MAIN_1_REGION

  tags = {
    Name = "main_public_1"
  }
}

resource "aws_subnet" "main_public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.MAIN_PUBLIC_2_CIDR
  map_public_ip_on_launch = true
  availability_zone       = var.MAIN_2_REGION

  tags = {
    Name = "main_public_2"
  }
}

resource "aws_subnet" "main_public_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.MAIN_PUBLIC_3_CIDR
  map_public_ip_on_launch = true
  availability_zone       = var.MAIN_3_REGION


  tags = {
    Name = "main_public_3"
  }
}

## ======= private subnet ======= ##
resource "aws_subnet" "main_private_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.MAIN_PRIVATE_1_CIDR
  map_public_ip_on_launch = false
  availability_zone       = var.MAIN_1_REGION

  tags = {
    Name = "main_private_1"
  }
}

resource "aws_subnet" "main_private_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.MAIN_PRIVATE_2_CIDR
  map_public_ip_on_launch = false
  availability_zone       = var.MAIN_2_REGION

  tags = {
    Name = "main_private_2"
  }
}

resource "aws_subnet" "main_private_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.MAIN_PRIVATE_3_CIDR
  map_public_ip_on_launch = false
  availability_zone       = var.MAIN_3_REGION


  tags = {
    Name = "main_private_3"
  }
}