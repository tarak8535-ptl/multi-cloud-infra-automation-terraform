module "terraform_bootstrap" {
  source = "../modules/terraform-bootstrap"
  prefix = var.resource_prefix
  tags   = var.tags
}