resource "aws_ecs_cluster" "sample_cluster" {
    name = var.ECS_CLUSTER_NAME
}