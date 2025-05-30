resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  # GitHub's OIDC thumbprints
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

locals {
  oidc_roles = merge(local.default_oidc_roles, var.roles)
}

data "aws_iam_policy_document" "assume_role_policy" {
  for_each = local.oidc_roles
  statement {
    principals {
      identifiers = [aws_iam_openid_connect_provider.github.arn]
      type        = "Federated"
    }
    actions = ["sts:AssumeRoleWithWebIdentity"]
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = each.value.allowed_subjects
    }
  }
}

resource "aws_iam_role" "cicd_role" {
  for_each            = local.oidc_roles
  name                = each.value.name
  assume_role_policy  = data.aws_iam_policy_document.assume_role_policy[each.key].json
  managed_policy_arns = each.value.custom_policy
}