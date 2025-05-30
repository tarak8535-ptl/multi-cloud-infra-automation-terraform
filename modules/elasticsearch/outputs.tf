output "domain_id" {
  description = "ID of the Elasticsearch domain"
  value       = aws_elasticsearch_domain.main.domain_id
}

output "domain_name" {
  description = "Name of the Elasticsearch domain"
  value       = aws_elasticsearch_domain.main.domain_name
}

output "domain_endpoint" {
  description = "Endpoint of the Elasticsearch domain"
  value       = aws_elasticsearch_domain.main.endpoint
}

output "domain_arn" {
  description = "ARN of the Elasticsearch domain"
  value       = aws_elasticsearch_domain.main.arn
}