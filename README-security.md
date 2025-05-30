# AWS Security Infrastructure with Terraform

This repository contains Terraform modules for deploying secure AWS infrastructure components.

## Modules

### Account Defaults

- Enforces strong password policies
- Configures account contacts and security settings

### Terraform Bootstrap

- Creates S3 bucket for Terraform state with encryption and versioning
- Sets up DynamoDB table for state locking
- Enforces TLS for S3 access

### OIDC Provider

- Configures OIDC integration with Bitbucket for CI/CD
- Creates IAM roles with least privilege permissions
- Supports custom role definitions

### Secure VPC

- Multi-AZ VPC with public, private, and firewall subnets
- NAT gateway for outbound internet access
- Security groups with least privilege access

### SSM Logging

- Session Manager configuration with enhanced security
- CloudWatch and S3 logging for session activity
- Log retention policies

## Environment Structure

The repository is organized with separate directories for each environment:

- **ctrk-dev-bom1**: Development environment in us-east-1
- **ctrk-prod-bom1**: Production environment in us-east-1
- **ctrk-prod-iad2**: Second production environment in us-east-1

## Usage

1. Configure variables in `terraform.tfvars`:

```hcl
aws_region = "us-east-1"
resource_prefix = "ctrk-dev"
is_federated = false

# OIDC Provider
bitbucket_workspace_name = "your-workspace"
bitbucket_workspace_uuid = "your-workspace-uuid"

# VPC
vpc_cidr = "10.0.0.0/16"
```

2. Initialize Terraform:

```bash
terraform init
```

3. Plan the deployment:

```bash
terraform plan -out=tfplan
```

4. Apply the changes:

```bash
terraform apply tfplan
```

## CI/CD Integration

The Bitbucket Pipelines configuration enables secure CI/CD:

- No long-lived AWS credentials in CI/CD pipelines
- Short-lived, scoped credentials via OIDC token exchange
- Repository-specific role permissions
- Approval gates between environments
