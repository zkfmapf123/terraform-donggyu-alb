<!-- BEGIN_TF_DOCS -->
## Description

- ALB + ECS Cluster 생성 module 

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_ecs_cluster_capacity_providers.cluster_providers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource |
| [aws_lb.lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.http_80](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.lb_443_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_attr"></a> [cluster\_attr](#input\_cluster\_attr) | ecs cluster 생성여부 | `map` | <pre>{<br>  "cluster_name": "",<br>  "is_create_cluster": false<br>}</pre> | no |
| <a name="input_lb_attr"></a> [lb\_attr](#input\_lb\_attr) | lb 속성값들을 정의합니다 | `map` | <pre>{<br>  "lb_delete_protection": true,<br>  "lb_name": "",<br>  "lb_sg_ids": [],<br>  "lb_subnet_ids": [],<br>  "lb_vpc": ""<br>}</pre> | no |
| <a name="input_lb_enable_access_logs"></a> [lb\_enable\_access\_logs](#input\_lb\_enable\_access\_logs) | lb에 AccessLog의 활성화 여부입니다 | `map` | <pre>{<br>  "is_enable": false,<br>  "s3_bucket_id": ""<br>}</pre> | no |
| <a name="input_lb_listener_attr"></a> [lb\_listener\_attr](#input\_lb\_listener\_attr) | listener 에서 사용될 속성입니다 | `map` | <pre>{<br>  "lb_acm_arn": ""<br>}</pre> | no |
| <a name="input_lb_listener_tg"></a> [lb\_listener\_tg](#input\_lb\_listener\_tg) | TargetGroup 에서 사용될 속성입니다. | `map` | <pre>{<br>  "tg_name": "",<br>  "tg_port": 80,<br>  "tg_protocol": "",<br>  "tg_target_type": "",<br>  "tg_vpc_id": ""<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_cluster_arn"></a> [ecs\_cluster\_arn](#output\_ecs\_cluster\_arn) | n/a |
| <a name="output_ecs_cluster_name"></a> [ecs\_cluster\_name](#output\_ecs\_cluster\_name) | n/a |
| <a name="output_lb_arn"></a> [lb\_arn](#output\_lb\_arn) | n/a |
| <a name="output_lb_id"></a> [lb\_id](#output\_lb\_id) | n/a |
| <a name="output_lb_name"></a> [lb\_name](#output\_lb\_name) | n/a |
| <a name="output_listener_443_arn"></a> [listener\_443\_arn](#output\_listener\_443\_arn) | n/a |
<!-- END_TF_DOCS -->