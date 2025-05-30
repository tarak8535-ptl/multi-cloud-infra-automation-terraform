variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, prod, etc)"
  type        = string
}

variable "enable_patch_management" {
  description = "Whether to enable patch management"
  type        = bool
  default     = true
}