# AWS Security Infrastructure with Terraform

This repository provides secure, modular Terraform code for AWS infrastructure, emphasizing best practices for security, compliance, and automation.

## Modules Overview

- **Account Defaults**: Enforces strong password policies and account security settings
- **Terraform Bootstrap**: S3 backend with encryption, versioning, and DynamoDB locking for state
- **OIDC Provider**: GitHub OIDC integration for secure CI/CD (no long-lived credentials)
- **VPC Secure**: Multi-AZ VPC with public, private, and firewall subnets, NAT, and security groups
- **SSM Logging**: Session Manager logging to S3 and CloudWatch, with retention and encryption
- **SSM Role**: IAM roles for SSM access and patch management
- **KMS**: Key management for encryption across services
- **EC2, RDS, Redshift, Elasticsearch, CloudFront, ACM, Route53**: Modular, secure provisioning of AWS services

## Environment Structure

- **ctrk-dev-bom1**: Development (ap-south-1)
- **ctrk-prod-bom1**: Production (ap-south-1)

Each environment is isolated and uses its own state, variables, and resources.

## Security Highlights

- No public database access; private subnets for sensitive resources
- S3, RDS, Redshift, Elasticsearch encrypted with KMS
- S3 public access blocked by default
- IAM roles and policies with least privilege
- Logging and monitoring enabled for all critical resources
- OIDC for secure, short-lived AWS credentials in CI/CD

## Usage

1. Configure variables in `terraform.tfvars` for your environment
2. Run `terraform init`, `terraform plan`, and `terraform apply`
3. Use GitHub Actions for automated CI/CD and security scanning

See `README.md` and `docs/architecture.md` for architecture and module usage details.
