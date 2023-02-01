terraform {
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.38"
    }
  }

  # we always use ireland for our backend S3
  backend "s3" {
    bucket         = "stevec-eu-west-1"
    key            = "ecr/terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
    region         = "eu-west-1"
    encrypt        = "true"
    # i didnt have time to set up all the permissions as its a new account im using
    # role_arn       = "arn:aws:iam::960049661466:role/terraform-admin-assume-role"
  }
}

provider "aws" {
  region = var.region

# i didnt have time to set up all the permissions as its a new account im using

#   assume_role {
#     role_arn = "arn:aws:iam::770537037907:role/terraform-admin-assume-role"
#   }
}