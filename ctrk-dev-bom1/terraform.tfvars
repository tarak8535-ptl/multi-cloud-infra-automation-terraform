aws_region      = "ap-south-1"
resource_prefix = "ctrk-dev"

# GitHub OIDC
github_org  = "Rp-Github"
github_repo = "multi-cloud-infra-automation-terraform"

# VPC
vpc_cidr              = "10.0.0.0/16"
enable_secondary_cidr = false

# Logging
log_retention_days = 90