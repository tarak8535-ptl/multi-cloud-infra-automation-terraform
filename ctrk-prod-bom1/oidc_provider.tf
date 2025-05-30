module "oidc_provider" {
  source      = "../modules/oidc-provider"
  github_org  = var.github_org
  github_repo = var.github_repo
  roles = {
    terraform_deploy = {
      name = "cicd-terraform-deploy"
      allowed_subjects = [
        "repo:${var.github_org}/${var.github_repo}:environment:ctrk-prod-bom1"
      ]
      custom_policy = [
        "arn:aws:iam::aws:policy/PowerUserAccess"
      ]
    }
  }
}