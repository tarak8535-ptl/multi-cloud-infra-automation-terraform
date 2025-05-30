output "ssm_document_name" {
  description = "Name of the SSM document"
  value       = aws_ssm_document.session_manager_prefs.name
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket for session logs"
  value       = aws_s3_bucket.session_logs.id
}

output "log_group_name" {
  description = "Name of the CloudWatch log group"
  value       = aws_cloudwatch_log_group.session_logs.name
}