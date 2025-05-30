resource "aws_kms_key" "main" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  policy                  = var.policy

  tags = {
    Name        = "${var.project_name}-${var.environment}-${var.key_name}"
    Project     = var.project_name
    Environment = var.environment
  }
}

resource "aws_kms_alias" "main" {
  name          = "alias/${var.project_name}-${var.environment}-${var.key_name}"
  target_key_id = aws_kms_key.main.key_id
}