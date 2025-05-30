variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "enable_secondary_cidr" {
  description = "Whether to enable a secondary CIDR block"
  type        = bool
  default     = false
}

variable "secondary_cidr" {
  description = "Secondary CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet 1"
  type        = string
}

variable "private_subnet_1_az" {
  description = "Availability zone for private subnet 1"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2"
  type        = string
}

variable "private_subnet_2_az" {
  description = "Availability zone for private subnet 2"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
}

variable "public_subnet_1_az" {
  description = "Availability zone for public subnet 1"
  type        = string
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
}

variable "public_subnet_2_az" {
  description = "Availability zone for public subnet 2"
  type        = string
}

variable "firewall_subnet_1_cidr" {
  description = "CIDR block for firewall subnet 1"
  type        = string
}

variable "firewall_subnet_1_az" {
  description = "Availability zone for firewall subnet 1"
  type        = string
}

variable "firewall_subnet_2_cidr" {
  description = "CIDR block for firewall subnet 2"
  type        = string
}

variable "firewall_subnet_2_az" {
  description = "Availability zone for firewall subnet 2"
  type        = string
}