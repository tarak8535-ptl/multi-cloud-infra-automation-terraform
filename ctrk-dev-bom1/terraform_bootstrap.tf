module "kms" {
  source                  = "../modules/kms"
  project_name            = var.resource_prefix
  environment             = var.environment
  key_name                = "${var.resource_prefix}-cmk"
  alias                   = "${var.resource_prefix}-cmk"
  description             = "CMK for environment-wide encryption"
  enable_key_rotation     = true
  deletion_window_in_days = 30
}

module "terraform_bootstrap" {
  source = "../modules/terraform-bootstrap"
  prefix = var.resource_prefix
  tags   = var.tags
  kms_key_id = module.kms.key_id
}