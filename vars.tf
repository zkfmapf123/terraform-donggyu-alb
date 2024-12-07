variable "cluster_attr" {
  description = "ecs cluster 생성여부"
  default = {
    is_create_cluster = false
    cluster_name      = ""
  }
}

variable "lb_listener_attr" {

  description = "listener 에서 사용될 속성입니다"
  default = {
    lb_acm_arn = ""
  }
}

variable "lb_listener_tg" {

  description = "TargetGroup 에서 사용될 속성입니다."
  default = {
    tg_name        = ""
    tg_vpc_id      = ""
    tg_port        = 80
    tg_protocol    = ""
    tg_target_type = "" ## ["instance" "ip" "lambda" "alb]
  }
}

variable "lb_attr" {
  description = "lb 속성값들을 정의합니다"

  default = {
    lb_name              = ""
    lb_vpc               = ""
    lb_sg_ids            = []
    lb_subnet_ids        = []
    lb_delete_protection = true
  }
}

variable "lb_enable_access_logs" {

  description = "lb에 AccessLog의 활성화 여부입니다"
  default = {
    is_enable    = false
    s3_bucket_id = ""
  }
}
