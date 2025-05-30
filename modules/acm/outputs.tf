output "certificate_id" {
  description = "ID of the certificate"
  value       = aws_acm_certificate.main.id
}

output "certificate_arn" {
  description = "ARN of the certificate"
  value       = aws_acm_certificate.main.arn
}

output "domain_validation_options" {
  description = "Domain validation options for the certificate"
  value       = aws_acm_certificate.main.domain_validation_options
}