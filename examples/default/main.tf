provider "aws" {
  profile = "leedonggyu"
  region  = "ap-northeast-2"
}

locals {
  vpc_id               = "vpc-0be5e4795b7e66a4f"
  webserver_subnet_ids = ["subnet-0ded2f9aa6b8e37d0", "subnet-096272491365decec"]
  default_sg_ids       = ["sg-0c8b3b1ffbb4e8105"]
}

module "alb" {
  source = "../../"

  cluster_attr = {
    is_create_cluster = true
    cluster_name      = "leedonggyu-test-cluster"
  }

  lb_listener_attr = {
    lb_acm_arn = "" ## Must...
  }

  lb_listener_tg = {
    tg_name        = "test-tg"
    tg_vpc_id      = local.vpc_id
    tg_port        = 80
    tg_protocol    = "HTTPS"
    tg_target_type = "ip"
  }

  lb_attr = {
    lb_name              = "test-lb"
    lb_vpc               = local.vpc_id
    lb_sg_ids            = local.default_sg_ids
    lb_subnet_ids        = local.webserver_subnet_ids
    lb_delete_protection = true
  }

  lb_enable_access_logs = {
    is_enable    = false
    s3_bucket_id = ""
  }
}
