module "ssm_logging" {
  source = "../modules/ssm-logging"

  ssm_document_name  = "${var.resource_prefix}-ssm-session-manager"
  s3_bucket_name     = "${var.resource_prefix}-ssm-session-logs"
  log_group_name     = "/aws/${var.resource_prefix}/ssm/session-logs"
  log_retention_days = var.log_retention_days
  kms_key_id         = module.kms.key_id
}