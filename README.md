# AWS Mod ECR


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| account\_role\_arn | Role ARN to assume when accessing the account | `string` | n/a | yes |
| aws\_region | This is the region that ECS will be created in | `any` | n/a | yes |
| environment | The environment we will be deploying to; development, staging etc. | `any` | n/a | yes |
| repositories | The ECR names to create | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ecr\_frankfurt | n/a |
| ecr\_ireland | n/a |
| ecr\_london | n/a |

