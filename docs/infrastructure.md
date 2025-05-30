# AWS Infrastructure Diagram

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
|           +--------------------------------------------------------+              |
|                                                                                   |
+-----------------------------------------------------------------------------------+
```

## Infrastructure Flow

1. **GitHub Actions** triggers the CI/CD pipeline for infrastructure deployment
2. **VPC** provides network isolation with public and private subnets
3. **EC2 Instance** in the public subnet hosts the web application
4. **RDS Database** in the private subnet stores application data
5. **S3 Bucket** stores static assets and files
6. **IAM Roles** provide secure access between services

## Security Measures

- EC2 instance in public subnet with restricted security group
- Database in private subnet, only accessible from EC2
- S3 bucket with encryption and versioning enabled
- IAM roles with least privilege permissions