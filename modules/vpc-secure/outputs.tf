output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

output "firewall_subnet_ids" {
  description = "IDs of the firewall subnets"
  value       = [aws_subnet.firewall_subnet_1.id, aws_subnet.firewall_subnet_2.id]
}

output "default_security_group_id" {
  description = "ID of the default security group"
  value       = aws_security_group.default.id
}

output "app_security_group_id" {
  description = "ID of the application security group"
  value       = aws_security_group.app_sg.id
}

output "db_security_group_id" {
  description = "ID of the database security group"
  value       = aws_security_group.db_sg.id
}