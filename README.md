# Multi-Cloud Infrastructure Automation with Terraform

This repository contains Terraform code for deploying and managing secure, multi-environment AWS infrastructure, with CI/CD integration using GitHub Actions and OIDC.

## Architecture Overview

- **Modular Terraform**: Each major AWS component is a reusable module (VPC, S3, RDS, EC2, IAM, CloudFront, Route53, etc.)
- **Multi-Environment**: Separate directories for dev and prod environments (e.g., `ctrk-dev-bom1`, `ctrk-prod-bom1`)
- **CI/CD**: Automated validation, planning, and deployment using GitHub Actions and OIDC roles
- **Security**: Encryption, least-privilege IAM, S3 public access block, strong password policies, and logging

## Environments

- **ctrk-dev-bom1**: Development environment
- **ctrk-prod-bom1**: Production environment

Each environment directory contains its own variable definitions and module instantiations.

## Module Structure

- **account-defaults**: AWS account-wide security settings (password policy, etc.)
- **oidc-provider**: GitHub OIDC integration for secure CI/CD
- **vpc / vpc-secure**: Network infrastructure (public/private/firewall subnets, NAT, IGW)
- **terraform-bootstrap**: S3 backend and DynamoDB for Terraform state management
- **ssm-logging**: SSM Session Manager logging to S3/CloudWatch
- **ssm-role**: IAM roles for SSM access
- **ec2**: EC2 instance provisioning
- **security**: Security groups for app and database
- **rds / redshift / elasticsearch**: Managed database and analytics services
- **cloudfront**: CDN for static content
- **acm**: SSL/TLS certificate management
- **route53**: DNS management
- **kms**: Key Management Service for encryption

## Getting Started

1. Fork this repository
2. Configure variables in the appropriate `terraform.tfvars` file for your environment
3. Run `terraform init`, `terraform plan`, and `terraform apply` in the environment directory

## CI/CD Workflow

- Security scan with Gitleaks
- Terraform validate, plan, and apply (per environment)
- Website deployment to S3/CloudFront
- OIDC roles for secure, short-lived AWS credentials

## Security Practices

- S3 buckets encrypted and versioned
- RDS/Redshift/Elasticsearch encrypted with KMS
- IAM roles with least privilege
- VPC with public/private/firewall subnets
- Logging and monitoring enabled

See `README-security.md` and `docs/architecture.md` for more details.