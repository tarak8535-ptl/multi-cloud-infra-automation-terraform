resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  count      = var.enable_secondary_cidr ? 1 : 0
  vpc_id     = aws_vpc.main.id
  cidr_block = var.secondary_cidr
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = var.enable_secondary_cidr ? aws_vpc_ipv4_cidr_block_association.secondary_cidr[0].vpc_id : aws_vpc.main.id
  cidr_block              = var.private_subnet_1_cidr
  availability_zone       = var.private_subnet_1_az
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${var.vpc_name}-private-1",
    "Type" = "private"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = var.enable_secondary_cidr ? aws_vpc_ipv4_cidr_block_association.secondary_cidr[0].vpc_id : aws_vpc.main.id
  cidr_block              = var.private_subnet_2_cidr
  availability_zone       = var.private_subnet_2_az
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${var.vpc_name}-private-2",
    "Type" = "private"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = var.enable_secondary_cidr ? aws_vpc_ipv4_cidr_block_association.secondary_cidr[0].vpc_id : aws_vpc.main.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = var.public_subnet_1_az
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${var.vpc_name}-public-1",
    "Type" = "public"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = var.enable_secondary_cidr ? aws_vpc_ipv4_cidr_block_association.secondary_cidr[0].vpc_id : aws_vpc.main.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.public_subnet_2_az
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${var.vpc_name}-public-2",
    "Type" = "public"
  }
}

resource "aws_subnet" "firewall_subnet_1" {
  vpc_id                  = var.enable_secondary_cidr ? aws_vpc_ipv4_cidr_block_association.secondary_cidr[0].vpc_id : aws_vpc.main.id
  cidr_block              = var.firewall_subnet_1_cidr
  availability_zone       = var.firewall_subnet_1_az
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${var.vpc_name}-firewall-1",
    "Type" = "firewall"
  }
}

resource "aws_subnet" "firewall_subnet_2" {
  vpc_id                  = var.enable_secondary_cidr ? aws_vpc_ipv4_cidr_block_association.secondary_cidr[0].vpc_id : aws_vpc.main.id
  cidr_block              = var.firewall_subnet_2_cidr
  availability_zone       = var.firewall_subnet_2_az
  map_public_ip_on_launch = false
  tags = {
    "Name" = "${var.vpc_name}-firewall-2",
    "Type" = "firewall"
  }
}