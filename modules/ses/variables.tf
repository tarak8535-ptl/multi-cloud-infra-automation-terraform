variable "domain_name" {
  description = "Domain name for SES"
  type        = string
}

variable "mail_from_domain" {
  description = "Mail from domain"
  type        = string
  default     = null
}

variable "route53_zone_id" {
  description = "Route53 zone ID for DNS records"
  type        = string
  default     = null
}

variable "create_verification_record" {
  description = "Whether to create verification record in Route53"
  type        = bool
  default     = false
}

variable "create_dkim_records" {
  description = "Whether to create DKIM records in Route53"
  type        = bool
  default     = false
}