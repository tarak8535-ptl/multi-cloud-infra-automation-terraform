variable "github_org" {
  description = "GitHub organization name"
  type        = string
  default     = "tarak8535-ptl"
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
  default     = ""
}

variable "roles" {
  description = "Map of custom roles to create"
  type = map(object({
    name             = string
    allowed_subjects = list(string)
    custom_policy    = list(string)
  }))
  default = {}
}