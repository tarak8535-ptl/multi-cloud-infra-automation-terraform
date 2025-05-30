variable "domain_name" {
  description = "Domain name for the Route53 zone"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, prod, etc)"
  type        = string
}

variable "records" {
  description = "Map of DNS records to create"
  type = map(object({
    type    = string
    ttl     = optional(number, 300)
    records = list(string)
  }))
  default = {}
}