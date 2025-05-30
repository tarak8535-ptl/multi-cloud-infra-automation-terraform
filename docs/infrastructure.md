# AWS Infrastructure Diagram & Flow

```
                                   +-------------------+
                                   |                   |
                                   |  GitHub Actions   |
                                   |     CI/CD         |
                                   |                   |
                                   +--------+----------+
                                            |
                                            v
+-----------------------------------------------------------------------------------+
|                                                                                   |
|                                    AWS Cloud                                      |
|                                                                                   |
|  +-------------------+        +-------------------+       +-------------------+   |
|  |                   |        |                   |       |                   |   |
|  |   VPC             |        |   IAM             |       |   S3              |   |
|  |                   |        |                   |       |                   |   |
|  +-------------------+        +-------------------+       +-------------------+   |
|           |                                                        ^              |
|           v                                                        |              |
|  +-------------------+        +-------------------+                 |              |
|  |                   |        |                   |                 |              |
|  |   Public Subnet   |        |   Private Subnet  |                 |              |
|  |                   |        |                   |                 |              |
|  +--------+----------+        +--------+----------+                 |              |
|           |                            |                            |              |
|           v                            v                            |              |
|  +-------------------+        +-------------------+                 |              |
|  |                   |        |                   |                 |              |
|  |   EC2 Instance    +------->+   RDS Database    |                 |              |
|  |   (Web Server)    |        |   (MySQL)         |                 |              |
|  |                   |        |                   |                 |              |
|  +--------+----------+        +-------------------+                 |              |
|           |                                                         |              |
|           |                                                         |              |
|           v                                                         |              |
|  +-------------------+        +-------------------+                 |              |
|  |                   |        |                   |                 |              |
|  |   Lambda/API GW   +------->+   CloudWatch      |<----------------+              |
|  |                   |        |   (Monitoring)    |                                |
|  +-------------------+        +-------------------+                                |
|                                                                                   |
+-----------------------------------------------------------------------------------+
```

## Components Overview

- **GitHub Actions**: Automates CI/CD for infrastructure and application deployments.
- **VPC**: Provides network isolation with public and private subnets.
- **IAM**: Manages access control and permissions using least-privilege roles and OIDC for CI/CD.
- **S3**: Stores static assets, logs, and Terraform state (encrypted, versioned, public access blocked).
- **EC2**: Hosts web applications in public subnet, accessed via SSM.
- **RDS/Redshift**: Databases in private subnet, not publicly accessible.
- **Lambda & API Gateway**: Serverless compute and API endpoints for microservices or automation.
- **CloudWatch**: Centralized logging, monitoring, and alerting for all resources.

## Infrastructure Flow

1. **GitHub Actions** triggers CI/CD for infrastructure and app deployment.
2. **IAM** roles and OIDC provide secure, least-privilege access for automation.
3. **VPC** isolates resources into public and private subnets.
4. **EC2** in public subnet hosts web apps, with SSM for secure access.
5. **Lambda/API Gateway** enables serverless workloads and APIs.
6. **RDS/Redshift** in private subnet for databases, not publicly accessible.
7. **S3** for static assets, logs, and Terraform state (encrypted, versioned).
8. **CloudWatch** aggregates logs and metrics for monitoring and alerting.

## Security Measures

- Private subnets for sensitive resources (databases, internal services)
- S3, RDS, Redshift, Elasticsearch encrypted with KMS
- S3 public access blocked and bucket policies enforced
- IAM roles with least privilege, OIDC for CI/CD, MFA for console access
- Logging and monitoring enabled via CloudWatch and S3
- Security Groups and NACLs restrict network access
- Automated patching and vulnerability scanning (where possible)
- Regular audits and compliance checks

See `README.md` and `README-security.md` for more details and best practices.