aws_region      = "ap-south-1"
resource_prefix = "ctrk-prod"

# GitHub OIDC
github_org  = "Rp-Github"
github_repo = "multi-cloud-infra-automation-terraform"

# VPC
vpc_cidr              = "10.1.0.0/16"
enable_secondary_cidr = true
secondary_cidr        = "172.16.0.0/16"

# Logging
log_retention_days = 365
kms_key_id         = "arn:aws:kms:ap-south-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"