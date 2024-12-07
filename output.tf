output "lb_name" {
  value = aws_lb.lb.name
}

output "lb_id" {
  value = aws_lb.lb.id
}

output "lb_arn" {
  value = aws_lb.lb.arn
}

output "listener_443_arn" {
  value = aws_lb_listener.http_443.arn
}

output "ecs_cluster_name" {
  value = length(aws_ecs_cluster.cluster) > 0 ? aws_ecs_cluster.cluster[0].name : null
}

output "ecs_cluster_arn" {
  value = length(aws_ecs_cluster.cluster) > 0 ? aws_ecs_cluster.cluster[0].arn : null
}
