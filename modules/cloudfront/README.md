# CloudFront Module

This module provisions an AWS CloudFront distribution with configurable parameters.

## Features

- Creates a CloudFront distribution with customizable settings
- Configurable origin settings
- Customizable cache behaviors
- Configurable geo-restrictions
- Supports IPv6

## Usage

```hcl
module "website_cloudfront" {
  source = "../modules/cloudfront"
  
  origin_domain_name     = "example.s3-website-us-east-1.amazonaws.com"
  origin_id              = "S3-example"
  origin_protocol_policy = "http-only"
  
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  
  allowed_methods = ["GET", "HEAD"]
  cached_methods  = ["GET", "HEAD"]
  
  viewer_protocol_policy = "redirect-to-https"
  
  tags = {
    Environment = "dev"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| origin_domain_name | Domain name of the origin | `string` | n/a | yes |
| origin_id | Unique identifier for the origin | `string` | n/a | yes |
| http_port | HTTP port the custom origin listens on | `number` | `80` | no |
| https_port | HTTPS port the custom origin listens on | `number` | `443` | no |
| origin_protocol_policy | Protocol policy to apply to the origin | `string` | `"http-only"` | no |
| origin_ssl_protocols | SSL/TLS protocols to use when communicating with the origin | `list(string)` | `["TLSv1.2"]` | no |
| enabled | Whether the distribution is enabled | `bool` | `true` | no |
| is_ipv6_enabled | Whether IPv6 is enabled for the distribution | `bool` | `true` | no |
| default_root_object | Object to return when the root URL is requested | `string` | `"index.html"` | no |
| allowed_methods | HTTP methods that CloudFront processes and forwards to the origin | `list(string)` | `["GET", "HEAD"]` | no |
| cached_methods | HTTP methods for which CloudFront caches responses | `list(string)` | `["GET", "HEAD"]` | no |
| forward_query_string | Whether to forward query strings to the origin | `bool` | `false` | no |
| forward_cookies | Specifies which cookies to forward to the origin | `string` | `"none"` | no |
| viewer_protocol_policy | Protocol that users can use to access the files | `string` | `"redirect-to-https"` | no |
| min_ttl | Minimum amount of time objects stay in CloudFront cache | `number` | `0` | no |
| default_ttl | Default amount of time objects stay in CloudFront cache | `number` | `3600` | no |
| max_ttl | Maximum amount of time objects stay in CloudFront cache | `number` | `86400` | no |
| price_class | Price class for the CloudFront distribution | `string` | `"PriceClass_100"` | no |
| geo_restriction_type | Method to use for restricting distribution | `string` | `"none"` | no |
| cloudfront_default_certificate | Whether to use the CloudFront default certificate | `bool` | `true` | no |
| tags | Tags to apply to the CloudFront distribution | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| distribution_id | ID of the CloudFront distribution |
| domain_name | Domain name of the CloudFront distribution |
| hosted_zone_id | Route 53 hosted zone ID for the CloudFront distribution |