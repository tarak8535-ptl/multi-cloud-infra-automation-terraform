# Multi-Cloud Infrastructure Automation with Terraform

This repository contains Terraform code for deploying and managing multi-environment infrastructure on AWS, with CI/CD integration using GitHub Actions.

## Architecture

This project implements a multi-environment infrastructure deployment with:

- GitHub Actions workflow for CI/CD
- GitHub OIDC integration with AWS for secure authentication
- S3 website hosting with CloudFront distribution
- VPC networking with public and private subnets
- Terraform state management with S3 backend and DynamoDB locking

## Environments

- **ctrk-dev-bom1**: Development environment
- **ctrk-prod-bom1**: Production environment

## GitHub OIDC Integration

This project uses GitHub's OIDC provider to authenticate with AWS without storing long-lived credentials. The workflow assumes different IAM roles based on the environment:

- `cicd-terraform-security`: Used for planning changes
- `cicd-terraform-deploy`: Used for applying infrastructure changes
- `cicd-website-deploy`: Used for deploying website content

## Getting Started

1. Fork this repository
2. Set up the required GitHub secrets:
   - `AWS_ACCOUNT_ID`: Your AWS account ID
   - `WEBSITE_BUCKET_NAME`: The S3 bucket name for the website (output from Terraform)
   - `CLOUDFRONT_DISTRIBUTION_ID`: The CloudFront distribution ID (output from Terraform)

3. Run the initial deployment manually to set up the OIDC provider:

```bash
cd ctrk-dev-bom1
terraform init
terraform apply
```

4. After the initial deployment, the GitHub Actions workflow will handle subsequent deployments.

## Workflow

The GitHub Actions workflow includes the following steps:

1. Security scanning with Gitleaks
2. Terraform validation
3. Planning changes for dev and prod environments
4. Deploying to dev environment
5. Deploying to prod environment
6. Deploying website content to S3 and invalidating CloudFront cache

## Module Structure

- **account-defaults**: AWS account settings
- **oidc-provider**: GitHub OIDC integration
- **vpc**: Network infrastructure
- **terraform-bootstrap**: S3 backend and DynamoDB for state management
- **ssm-logging**: SSM session logging
- **ssm-role**: IAM roles for SSM