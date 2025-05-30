module "ssm_role" {
  source = "../modules/ssm-role"

  project_name            = var.resource_prefix
  environment             = "dev"
  enable_patch_management = true
}