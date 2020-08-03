locals {
  common_tags = {
    service     = "ECR"
    environment = var.environment
    repository  = "https://github.com/r2l332/aws-mod-ecs.git"
    created_by  = "Terraform"
  }
  repos = var.repositories
}