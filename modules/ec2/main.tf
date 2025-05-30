data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "app" {
  ami                    = var.ami_id != null ? var.ami_id : data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id != null ? var.subnet_id : var.public_subnet_ids[0]
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name != null && var.key_name != "" ? var.key_name : null
  iam_instance_profile   = var.iam_instance_profile
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  user_data = var.user_data != null ? var.user_data : <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Welcome to ${var.project_name} ${var.environment} environment</h1>" > /var/www/html/index.html
              EOF

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.encrypted
    kms_key_id  = var.kms_key_id
  }

  tags = merge(
    {
      Name        = "${var.project_name}-${var.environment}-${var.name}"
      Project     = var.project_name
      Environment = var.environment
    },
    var.tags
  )
}