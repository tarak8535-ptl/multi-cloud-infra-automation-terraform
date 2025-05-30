output "cluster_id" {
  description = "ID of the Redshift cluster"
  value       = aws_redshift_cluster.main.id
}

output "cluster_endpoint" {
  description = "Endpoint of the Redshift cluster"
  value       = aws_redshift_cluster.main.endpoint
}

output "cluster_arn" {
  description = "ARN of the Redshift cluster"
  value       = aws_redshift_cluster.main.arn
}