variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, prod, etc)"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the certificate"
  type        = string
}

variable "subject_alternative_names" {
  description = "Subject alternative names for the certificate"
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "Validation method for the certificate"
  type        = string
  default     = "DNS"
}

variable "create_validation_records" {
  description = "Whether to create validation records in Route53"
  type        = bool
  default     = false
}

variable "route53_zone_id" {
  description = "Route53 zone ID for validation records"
  type        = string
  default     = null
}