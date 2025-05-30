resource "aws_route53_zone" "main" {
  name = var.domain_name

  tags = {
    Name        = var.domain_name
    Project     = var.project_name
    Environment = var.environment
  }
}

resource "aws_route53_record" "records" {
  for_each = var.records

  zone_id = aws_route53_zone.main.zone_id
  name    = each.key
  type    = each.value.type
  ttl     = lookup(each.value, "ttl", 300)
  records = each.value.records
}