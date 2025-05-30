# Web Application Deployment

This document describes the deployment of a web application using Terraform modules.

## Architecture

The web application is deployed with the following components:

- **EC2 Instance**: Hosts the web application
- **Security Group**: Controls traffic to the EC2 instance
- **Route53**: Manages DNS records for the domain

## Deployment Details

### EC2 Instance

The web application is hosted on an EC2 instance using the EC2 module. The instance:

- Runs Amazon Linux 2
- Has Apache HTTP server installed
- Serves content from a GitHub repository
- Is configured with a virtual host for the domain

### Domain Configuration

The application is accessible via the domain `rushipatel.opsbyhnr.online`. DNS is managed using the Route53 module.

## Implementation

The implementation uses existing modules:

- `modules/ec2`: Provisions the EC2 instance
- `modules/route53`: Manages DNS records

## Usage

To deploy the web application:

1. Ensure the required variables are set in `terraform.tfvars`
2. Run `terraform init` to initialize the working directory
3. Run `terraform plan` to see the execution plan
4. Run `terraform apply` to apply the changes

## Access

After deployment, the web application will be accessible at:
- http://rushipatel.opsbyhnr.online

## Maintenance

To update the website content:

1. Update the GitHub repository: https://github.com/tarak8535-ptl/tarak8535-ptl.github.io
2. SSH into the EC2 instance
3. Run the following commands:
   ```bash
   cd /tmp
   git clone https://github.com/tarak8535-ptl/tarak8535-ptl.github.io.git
   cp -r /tmp/tarak8535-ptl.github.io/* /var/www/html/
   chown -R apache:apache /var/www/html/
   ```