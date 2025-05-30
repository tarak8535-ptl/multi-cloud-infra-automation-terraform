module "oidc_provider" {
  source      = "../modules/oidc-provider"
  github_org  = var.github_org
  github_repo = var.github_repo
  roles       = {}
}