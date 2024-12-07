resource "aws_ecs_cluster" "cluster" {
  count = lookup(var.cluster_attr, "is_create_cluster") ? 1 : 0

  name = lookup(var.cluster_attr, "cluster_name")

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "cluster_providers" {
  count = lookup(var.cluster_attr, "is_create_cluster") ? 1 : 0

  cluster_name = aws_ecs_cluster.cluster[0].name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}
