terraform {
  backend "s3" {
    bucket         = "ctrk-dev-terraformstate"
    key            = "ctrk-dev-bom1/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "ctrk-dev-terraform-locks"
    encrypt        = true
  }
}