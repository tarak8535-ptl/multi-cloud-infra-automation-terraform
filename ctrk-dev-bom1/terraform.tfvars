aws_region      = "ap-south-1"
resource_prefix = "ctrk-dev"
environment     = "dev"

# GitHub OIDC
github_org  = "Rp-Github"
github_repo = "multi-cloud-infra-automation-terraform"

# VPC
vpc_cidr              = "10.0.0.0/16"
enable_secondary_cidr = false
secondary_cidr        = ""

# Logging
log_retention_days = 90
kms_key_id         = ""

# Tags
tags = {
  Project     = "CTRK"
  Environment = "dev"
  Owner       = "DevOps"
}