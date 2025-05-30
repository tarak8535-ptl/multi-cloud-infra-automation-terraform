module "vpc" {
  source = "../modules/vpc-secure"

  vpc_name              = "${var.resource_prefix}-vpc"
  vpc_cidr              = var.vpc_cidr
  enable_secondary_cidr = var.enable_secondary_cidr
  secondary_cidr        = var.secondary_cidr

  private_subnet_1_cidr = "10.0.1.0/24"
  private_subnet_1_az   = "ap-south-1a"
  private_subnet_2_cidr = "10.0.2.0/24"
  private_subnet_2_az   = "ap-south-1b"

  public_subnet_1_cidr = "10.0.3.0/24"
  public_subnet_1_az   = "ap-south-1a"
  public_subnet_2_cidr = "10.0.4.0/24"
  public_subnet_2_az   = "ap-south-1b"

  firewall_subnet_1_cidr = "10.0.5.0/24"
  firewall_subnet_1_az   = "ap-south-1a"
  firewall_subnet_2_cidr = "10.0.6.0/24"
  firewall_subnet_2_az   = "ap-south-1b"
}