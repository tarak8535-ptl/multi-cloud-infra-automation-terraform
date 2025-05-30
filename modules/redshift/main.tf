resource "aws_redshift_subnet_group" "main" {
  name       = "${var.project_name}-${var.environment}-redshift-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-redshift-subnet-group"
    Project     = var.project_name
    Environment = var.environment
  }
}

resource "aws_redshift_cluster" "main" {
  cluster_identifier        = "${var.project_name}-${var.environment}-redshift"
  database_name             = var.database_name
  master_username           = var.master_username
  master_password           = var.master_password
  node_type                 = var.node_type
  cluster_type              = var.cluster_type
  number_of_nodes           = var.cluster_type == "single-node" ? null : var.number_of_nodes
  cluster_subnet_group_name = aws_redshift_subnet_group.main.name
  vpc_security_group_ids    = var.security_group_ids
  skip_final_snapshot       = var.skip_final_snapshot
  final_snapshot_identifier = var.skip_final_snapshot ? null : "${var.project_name}-${var.environment}-redshift-final-snapshot"
  encrypted                 = var.encrypted
  kms_key_id                = var.kms_key_id

  tags = {
    Name        = "${var.project_name}-${var.environment}-redshift"
    Project     = var.project_name
    Environment = var.environment
  }
}