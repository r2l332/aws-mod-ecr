module "aws_mod_ecr" {
  source       = "./modules/ecr"
  aws_region   = var.aws_region
  environment  = var.environment
  repositories = var.repositories
  providers = {
    aws.ireland   = aws.eu-west-1
    aws.london    = aws.eu-west-2
    aws.frankfurt = aws.eu-central-1
  }
}