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

variable "alias" {
  description = "The display name of the alias. Do not include the 'alias/' prefix."
  type        = string
}

variable "description" {
  description = "The description of the KMS key."
  type        = string
  default     = "Managed by Terraform"
}

variable "deletion_window_in_days" {
  description = "Waiting period for key deletion. Must be between 7 and 30 days."
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled."
  type        = bool
  default     = true
}

variable "policy" {
  description = "A valid KMS key policy JSON document."
  type        = string
  default     = null
}