terraform {
  required_version = "~> 0.12.25"
}

provider "aws" {
  region = "eu-west-1"

  assume_role {
    role_arn = var.account_role_arn
  }
}

provider "aws" {
  version = "~> 2.51"
  region  = "eu-west-1"
  alias   = "eu-west-1"

  assume_role {
    role_arn = var.account_role_arn
  }
}

provider "aws" {
  version = "~> 2.51"
  region  = "eu-west-2"
  alias   = "eu-west-2"

  assume_role {
    role_arn = var.account_role_arn
  }
}

provider "aws" {
  version = "~> 2.51"
  region  = "eu-central-1"
  alias   = "eu-central-1"

  assume_role {
    role_arn = var.account_role_arn
  }
}