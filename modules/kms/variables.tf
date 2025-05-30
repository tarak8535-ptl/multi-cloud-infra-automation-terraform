variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, prod, etc)"
  type        = string
}

variable "key_name" {
  description = "Name of the KMS key"
  type        = string
}

variable "description" {
  description = "Description of the KMS key"
  type        = string
  default     = "KMS key for encryption"
}

variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted"
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "Whether to enable key rotation"
  type        = bool
  default     = true
}

variable "policy" {
  description = "Policy for the KMS key"
  type        = string
  default     = null
}