# AWS Infrastructure Architecture

This document provides an overview of the AWS infrastructure architecture managed by this repository.

## Core Components

- **Networking (VPC)**: Isolated VPC with public, private, and firewall subnets across multiple AZs, NAT/IGW, and route tables
- **Compute (EC2)**: Application servers in public subnets, with SSM access and security groups
- **Database (RDS/Redshift)**: Managed databases in private subnets, encrypted with KMS, and restricted by security groups
- **Storage (S3)**: Encrypted, versioned S3 buckets for assets, logs, and Terraform state
- **IAM**: Roles and policies for least-privilege access, OIDC integration for CI/CD
- **CloudFront & ACM**: CDN and SSL for static content and web apps
- **Route53**: DNS management for all environments

## Security & Compliance

- Private subnets for sensitive resources
- S3, RDS, Redshift, Elasticsearch encrypted with KMS
- S3 public access blocked
- IAM roles with least privilege
- Logging (VPC flow logs, SSM, CloudWatch)
- OIDC for secure, short-lived credentials in CI/CD

## High Availability & DR

- Multi-AZ deployment for VPC, RDS, and subnets
- S3 versioning and RDS automated backups

## CI/CD Integration

- GitHub Actions with OIDC for secure, automated deployments
- Separate roles for plan/apply/website deploy

See `README.md` for module structure and usage.