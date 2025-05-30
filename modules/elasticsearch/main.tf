resource "aws_elasticsearch_domain" "main" {
  domain_name           = "${var.project_name}-${var.environment}-es"
  elasticsearch_version = var.elasticsearch_version

  cluster_config {
    instance_type            = var.instance_type
    instance_count           = var.instance_count
    dedicated_master_enabled = var.dedicated_master_enabled
    dedicated_master_type    = var.dedicated_master_enabled ? var.dedicated_master_type : null
    dedicated_master_count   = var.dedicated_master_enabled ? var.dedicated_master_count : null
    zone_awareness_enabled   = var.zone_awareness_enabled
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  encrypt_at_rest {
    enabled    = var.encrypt_at_rest
    kms_key_id = var.kms_key_id
  }

  node_to_node_encryption {
    enabled = var.node_to_node_encryption
  }

  vpc_options {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  advanced_options = var.advanced_options

  tags = {
    Name        = "${var.project_name}-${var.environment}-es"
    Project     = var.project_name
    Environment = var.environment
  }
}