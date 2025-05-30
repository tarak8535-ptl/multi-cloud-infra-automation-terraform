resource "aws_ses_domain_identity" "main" {
  domain = var.domain_name
}

resource "aws_ses_domain_dkim" "main" {
  domain = aws_ses_domain_identity.main.domain
}

resource "aws_ses_domain_mail_from" "main" {
  count            = var.mail_from_domain != null ? 1 : 0
  domain           = aws_ses_domain_identity.main.domain
  mail_from_domain = var.mail_from_domain
}

resource "aws_route53_record" "ses_verification" {
  count   = var.create_verification_record ? 1 : 0
  zone_id = var.route53_zone_id
  name    = "_amazonses.${aws_ses_domain_identity.main.domain}"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.main.verification_token]
}

resource "aws_route53_record" "ses_dkim" {
  count   = var.create_dkim_records ? 3 : 0
  zone_id = var.route53_zone_id
  name    = "${element(aws_ses_domain_dkim.main.dkim_tokens, count.index)}._domainkey.${aws_ses_domain_identity.main.domain}"
  type    = "CNAME"
  ttl     = "600"
  records = ["${element(aws_ses_domain_dkim.main.dkim_tokens, count.index)}.dkim.amazonses.com"]
}