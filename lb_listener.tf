############################################################### Resource ###############################################################
resource "aws_lb_listener" "http_80" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

  tags = {

  }
}

/*
    @url : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group

    ## Instance Target Group
        name        = String
        port        = Number
        protocol    = "HTTP"
        vpc_id      = String
        

    ## IP Target Group
        port        = Number
        protocol    = "HTTP"
        target_type = "ip"
        vpc_id      = String
*/
resource "aws_lb_target_group" "lb_443_tg" {
  name        = lookup(var.lb_listener_tg, "tg_name")
  port        = lookup(var.lb_listener_tg, "tg_port")
  protocol    = lookup(var.lb_listener_tg, "tg_protocol")
  target_type = try(lookup(var.lb_listener_tg, "tg_target_type"), null)
  vpc_id      = lookup(var.lb_listener_tg, "tg_vpc_id")

  tags = {

  }
}

resource "aws_lb_listener" "http_443" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = lookup(var.lb_listener_attr, "lb_acm_arn")

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_443_tg.arn
  }

  tags = {

  }
}


