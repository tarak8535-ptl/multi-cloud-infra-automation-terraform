# EC2 Module

This module provisions an EC2 instance with configurable parameters.

## Features

- Creates an EC2 instance with customizable settings
- Uses Amazon Linux 2 AMI by default (can be overridden)
- Configurable instance type, volume size, and encryption
- Supports custom user data scripts
- Configurable security groups and subnet placement

## Usage

```hcl
module "web_server" {
  source = "../modules/ec2"

  vpc_id            = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
  security_group_id = aws_security_group.web.id
  instance_type     = "t3.micro"
  key_name          = var.key_name
  project_name      = "project"
  environment       = "dev"
  name              = "web"

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
  EOF

  root_volume_size = 10
  root_volume_type = "gp3"
  encrypted        = true

  tags = {
    Service = "Website"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc_id | ID of the VPC | `string` | n/a | yes |
| public_subnet_ids | IDs of the public subnets | `list(string)` | `[]` | no |
| subnet_id | ID of the subnet where the instance will be launched | `string` | `null` | no |
| security_group_id | ID of the security group | `string` | n/a | yes |
| instance_type | EC2 instance type | `string` | `"t3.micro"` | no |
| ami_id | AMI ID for the EC2 instance | `string` | `null` | no |
| key_name | SSH key name for EC2 instances | `string` | n/a | yes |
| project_name | Name of the project | `string` | n/a | yes |
| environment | Environment (dev, staging, prod) | `string` | n/a | yes |
| name | Name for the EC2 instance | `string` | `"app"` | no |
| user_data | Custom user data script for EC2 instance | `string` | `null` | no |
| root_volume_size | Size of the root volume in GB | `number` | `8` | no |
| root_volume_type | Type of the root volume | `string` | `"gp2"` | no |
| encrypted | Whether to encrypt the root volume | `bool` | `true` | no |
| kms_key_id | KMS key ID for encryption | `string` | `null` | no |
| iam_instance_profile | IAM instance profile name | `string` | `null` | no |
| tags | Additional tags for the EC2 instance | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | ID of the EC2 instance |
| public_ip | Public IP of the EC2 instance |
| public_dns | Public DNS of the EC2 instance |