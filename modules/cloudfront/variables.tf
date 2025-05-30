variable "origin_domain_name" {
  description = "Domain name of the origin"
  type        = string
}

variable "origin_id" {
  description = "Unique identifier for the origin"
  type        = string
}

variable "http_port" {
  description = "HTTP port the custom origin listens on"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "HTTPS port the custom origin listens on"
  type        = number
  default     = 443
}

variable "origin_protocol_policy" {
  description = "Protocol policy to apply to the origin"
  type        = string
  default     = "http-only"
}

variable "origin_ssl_protocols" {
  description = "SSL/TLS protocols to use when communicating with the origin"
  type        = list(string)
  default     = ["TLSv1.2"]
}

variable "enabled" {
  description = "Whether the distribution is enabled"
  type        = bool
  default     = true
}

variable "is_ipv6_enabled" {
  description = "Whether IPv6 is enabled for the distribution"
  type        = bool
  default     = true
}

variable "default_root_object" {
  description = "Object to return when the root URL is requested"
  type        = string
  default     = "index.html"
}

variable "allowed_methods" {
  description = "HTTP methods that CloudFront processes and forwards to the origin"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cached_methods" {
  description = "HTTP methods for which CloudFront caches responses"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "forward_query_string" {
  description = "Whether to forward query strings to the origin"
  type        = bool
  default     = false
}

variable "forward_cookies" {
  description = "Specifies which cookies to forward to the origin"
  type        = string
  default     = "none"
}

variable "viewer_protocol_policy" {
  description = "Protocol that users can use to access the files"
  type        = string
  default     = "redirect-to-https"
}

variable "min_ttl" {
  description = "Minimum amount of time objects stay in CloudFront cache"
  type        = number
  default     = 0
}

variable "default_ttl" {
  description = "Default amount of time objects stay in CloudFront cache"
  type        = number
  default     = 3600
}

variable "max_ttl" {
  description = "Maximum amount of time objects stay in CloudFront cache"
  type        = number
  default     = 86400
}

variable "price_class" {
  description = "Price class for the CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}

variable "geo_restriction_type" {
  description = "Method to use for restricting distribution"
  type        = string
  default     = "none"
}

variable "cloudfront_default_certificate" {
  description = "Whether to use the CloudFront default certificate"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the CloudFront distribution"
  type        = map(string)
  default     = {}
}