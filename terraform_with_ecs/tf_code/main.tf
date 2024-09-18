provider "aws" {
  region = var.AWS_REGION
}

module "aws-ecr-repository" {
  source = "./ecr"
  ECR_REPO_NAME = var.ECR_REPO_NAME
}

module "aws-ecs" {
  source = "./ecs"
  ECS_CLUSTER_NAME = var.ECS_CLUSTER_NAME
}