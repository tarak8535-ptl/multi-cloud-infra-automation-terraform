variable "ssm_document_name" {
  description = "Name of the SSM document"
  type        = string
  default     = "SSM-SessionManagerSettings"
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = ""
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for session logs"
  type        = string
}

variable "s3_key_prefix" {
  description = "Prefix for S3 objects"
  type        = string
  default     = "session-logs"
}

variable "s3_encryption_enabled" {
  description = "Whether to enable S3 encryption"
  type        = bool
  default     = true
}

variable "log_group_name" {
  description = "Name of the CloudWatch log group"
  type        = string
  default     = "/aws/ssm/session-logs"
}

variable "cloudwatch_encryption_enabled" {
  description = "Whether to enable CloudWatch encryption"
  type        = bool
  default     = true
}

variable "cloudwatch_streaming_enabled" {
  description = "Whether to enable CloudWatch streaming"
  type        = bool
  default     = true
}

variable "idle_session_timeout" {
  description = "Idle session timeout in minutes"
  type        = string
  default     = "20"
}

variable "max_session_duration" {
  description = "Maximum session duration in minutes"
  type        = string
  default     = "60"
}

variable "run_as_enabled" {
  description = "Whether to enable run as"
  type        = bool
  default     = false
}

variable "linux_shell_profile" {
  description = "Shell profile for Linux"
  type        = string
  default     = "echo 'Session started'; date"
}

variable "windows_shell_profile" {
  description = "Shell profile for Windows"
  type        = string
  default     = "echo 'Session started'; Get-Date"
}

variable "log_retention_days" {
  description = "Number of days to retain logs"
  type        = number
  default     = 90
}