output "role_id" {
  description = "ID of the IAM role"
  value       = aws_iam_role.ssm_role.id
}

output "role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.ssm_role.arn
}

output "instance_profile_id" {
  description = "ID of the IAM instance profile"
  value       = aws_iam_instance_profile.ssm_instance_profile.id
}

output "instance_profile_arn" {
  description = "ARN of the IAM instance profile"
  value       = aws_iam_instance_profile.ssm_instance_profile.arn
}

output "instance_profile_name" {
  description = "Name of the IAM instance profile"
  value       = aws_iam_instance_profile.ssm_instance_profile.name
}