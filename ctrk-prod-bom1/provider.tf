terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = merge(
      var.tags,
      {
        Environment = var.environment
        ManagedBy   = "Terraform"
        ManagedBy   = "multi-cloud-infra-automation-terraform"
        Owner       = "CloudTarkK"
      }
    )
  }
}