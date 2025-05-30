output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

/* Commented out until web server module is implemented
output "web_server_instance_id" {
  description = "ID of the web server EC2 instance"
  value       = module.web_server.instance_id
}

output "web_server_public_ip" {
  description = "Public IP of the web server"
  value       = aws_eip.web.public_ip
}

output "website_url" {
  description = "URL to access the website"
  value       = "http://${aws_eip.web.public_ip}"
}
*/