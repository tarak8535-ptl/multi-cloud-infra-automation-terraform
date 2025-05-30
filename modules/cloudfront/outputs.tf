output "distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.main.id
}

output "domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.main.domain_name
}

output "hosted_zone_id" {
  description = "Route 53 hosted zone ID for the CloudFront distribution"
  value       = aws_cloudfront_distribution.main.hosted_zone_id
}