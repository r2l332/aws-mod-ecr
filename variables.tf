variable "account_role_arn" {
  description = "Role ARN to assume when accessing the account"
  type        = string
}
variable "aws_region" {
  description = "This is the region that ECS will be created in"
}
variable "environment" {
  description = "The environment we will be deploying to; development, staging etc."
}
variable "repositories" {
  type        = list(string)
  description = "The ECR names to create"
}