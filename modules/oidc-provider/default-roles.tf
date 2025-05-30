locals {
  default_oidc_roles = {
    terraform_security = {
      name = "cicd-terraform-security"
      allowed_subjects = [
        "repo:${var.github_org}/${var.github_repo}:environment:ctrk-dev-bom1-plan",
        "repo:${var.github_org}/${var.github_repo}:environment:ctrk-prod-bom1-plan",
        "repo:${var.github_org}/${var.github_repo}:environment:ctrk-dev-bom1",
        "repo:${var.github_org}/${var.github_repo}:environment:ctrk-prod-bom1"
      ]
      custom_policy = [
        "arn:aws:iam::aws:policy/ReadOnlyAccess"
      ]
    }

    terraform_deploy = {
      name = "cicd-terraform-deploy"
      allowed_subjects = [
        "repo:${var.github_org}/${var.github_repo}:environment:ctrk-dev-bom1",
        "repo:${var.github_org}/${var.github_repo}:environment:ctrk-prod-bom1"
      ]
      custom_policy = [
        "arn:aws:iam::aws:policy/PowerUserAccess"
      ]
    }

    website_deploy = {
      name = "cicd-website-deploy"
      allowed_subjects = [
        "repo:${var.github_org}/${var.github_repo}:environment:website-deploy"
      ]
      custom_policy = [
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/CloudFrontFullAccess"
      ]
    }
  }
}