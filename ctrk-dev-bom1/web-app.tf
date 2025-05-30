resource "aws_security_group" "web" {
  name        = "ctrk-dev-web-sg"
  description = "Security group for web servers"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Using SSM for instance access instead of SSH

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "ctrk-dev-web-sg"
    Environment = var.environment
  }
}

module "web_server" {
  source = "../modules/ec2"

  vpc_id               = var.vpc_id
  public_subnet_ids    = var.public_subnet_ids
  security_group_id    = aws_security_group.web.id
  instance_type        = "t3.micro"
  key_name             = null # Using SSM instead of SSH
  iam_instance_profile = module.ssm_role.instance_profile_name
  project_name         = "ctrk"
  environment          = var.environment
  name                 = "web"

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd git
    
    # Start and enable Apache
    systemctl start httpd
    systemctl enable httpd
    
    # Clone the website repository
    cd /tmp
    git clone https://github.com/tarak8535-ptl/tarak8535-ptl.github.io.git
    
    # Copy website files to Apache document root
    cp -r /tmp/tarak8535-ptl.github.io/* /var/www/html/
    
    # Set proper permissions
    chown -R apache:apache /var/www/html/
    chmod -R 755 /var/www/html/
    
    # Add virtual host configuration for the domain
    cat > /etc/httpd/conf.d/vhost.conf << 'VHOSTCONF'
    <VirtualHost *:80>
        ServerName rushipatel.opsbyhnr.online
        DocumentRoot /var/www/html
        
        <Directory /var/www/html>
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
        </Directory>
        
        ErrorLog /var/log/httpd/rushipatel.opsbyhnr.online-error.log
        CustomLog /var/log/httpd/rushipatel.opsbyhnr.online-access.log combined
    </VirtualHost>
    VHOSTCONF
    
    # Restart Apache to apply changes
    systemctl restart httpd
  EOF

  root_volume_size = 10
  root_volume_type = "gp3"
  encrypted        = true

  tags = {
    Service = "Website"
  }
}

# Use existing Route53 module to create DNS record
module "dns" {
  source = "../modules/route53"

  domain_name  = "opsbyhnr.online"
  project_name = "ctrk"
  environment  = var.environment

  records = {
    "rushipatel" = {
      type    = "A"
      ttl     = 300
      records = [module.web_server.public_ip]
    }
  }
}

output "web_server_id" {
  description = "ID of the web server instance"
  value       = module.web_server.instance_id
}

output "web_server_public_ip" {
  description = "Public IP address of the web server"
  value       = module.web_server.public_ip
}

output "website_url" {
  description = "Website URL"
  value       = "http://rushipatel.opsbyhnr.online"
}