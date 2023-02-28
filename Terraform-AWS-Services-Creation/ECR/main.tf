terraform {
  backend "s3" {
    bucket = "terraform-state-devopsthehardway"
    key    = "ecr-terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "devopsthehardway-ecr-repo" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    git_org  = "amckenzie7"
    git_repo = "DevOps-The-Hard-Way-AWS"
  }
}