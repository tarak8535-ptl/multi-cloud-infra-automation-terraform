variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, prod, etc)"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Redshift subnet group"
  type        = list(string)
}

variable "database_name" {
  description = "Name of the database"
  type        = string
}

variable "master_username" {
  description = "Username for the master user"
  type        = string
}

variable "master_password" {
  description = "Password for the master user"
  type        = string
  sensitive   = true
}

variable "node_type" {
  description = "Node type for the Redshift cluster"
  type        = string
  default     = "dc2.large"
}

variable "cluster_type" {
  description = "Cluster type (single-node or multi-node)"
  type        = string
  default     = "single-node"
}

variable "number_of_nodes" {
  description = "Number of nodes in the cluster (required for multi-node)"
  type        = number
  default     = 2
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "skip_final_snapshot" {
  description = "Whether to skip final snapshot when deleting the cluster"
  type        = bool
  default     = false
}

variable "encrypted" {
  description = "Whether to encrypt the cluster"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}