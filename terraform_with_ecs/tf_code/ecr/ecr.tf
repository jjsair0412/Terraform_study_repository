resource "aws_ecr_repository" "myapp" {
    name = var.ECR_REPO_NAME
}