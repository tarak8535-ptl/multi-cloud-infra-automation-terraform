terraform {
  backend "s3" {
    bucket         = "ctrk-prod-terraformstate"
    key            = "ctrk-prod-bom1/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "ctrk-prod-terraform-locks"
    encrypt        = true
  }
}