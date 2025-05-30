resource "aws_cloudwatch_log_group" "session_logs" {
  name              = var.log_group_name
  retention_in_days = var.log_retention_days
  kms_key_id        = var.kms_key_id

  tags = {
    Name = var.log_group_name
  }
}