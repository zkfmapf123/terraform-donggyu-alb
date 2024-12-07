############################################################### Resource ###############################################################
resource "aws_lb" "lb" {
  name            = replace(lookup(var.lb_attr, "lb_name"), "_", "-")
  security_groups = lookup(var.lb_attr, "lb_sg_ids")
  subnets         = lookup(var.lb_attr, "lb_subnet_ids")

  internal           = false
  load_balancer_type = "application"

  enable_deletion_protection = lookup(var.lb_attr, "lb_delete_protection")

  dynamic "access_logs" {
    for_each = lookup(var.lb_enable_access_logs, "is_enable") ? [1] : []

    content {
      bucket  = lookup(var.lb_enable_access_logs, "s3_bucket_id")
      prefix  = replace(lookup(var.lb_attr, "lb_name"), "_", "-")
      enabled = true
    }
  }

  tags = {

  }
}
