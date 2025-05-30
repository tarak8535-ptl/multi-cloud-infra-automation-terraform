variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment (dev, prod, etc)"
  type        = string
}

variable "elasticsearch_version" {
  description = "Version of Elasticsearch"
  type        = string
  default     = "7.10"
}

variable "instance_type" {
  description = "Instance type for the Elasticsearch cluster"
  type        = string
  default     = "t3.small.elasticsearch"
}

variable "instance_count" {
  description = "Number of instances in the cluster"
  type        = number
  default     = 2
}

variable "dedicated_master_enabled" {
  description = "Whether to enable dedicated master nodes"
  type        = bool
  default     = false
}

variable "dedicated_master_type" {
  description = "Instance type for dedicated master nodes"
  type        = string
  default     = "t3.small.elasticsearch"
}

variable "dedicated_master_count" {
  description = "Number of dedicated master nodes"
  type        = number
  default     = 3
}

variable "zone_awareness_enabled" {
  description = "Whether to enable zone awareness"
  type        = bool
  default     = true
}

variable "volume_size" {
  description = "Size of EBS volume per node in GB"
  type        = number
  default     = 10
}

variable "volume_type" {
  description = "Type of EBS volume"
  type        = string
  default     = "gp2"
}

variable "encrypt_at_rest" {
  description = "Whether to enable encryption at rest"
  type        = bool
  default     = true
}

variable "node_to_node_encryption" {
  description = "Whether to enable node-to-node encryption"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "KMS key ID for encryption"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "advanced_options" {
  description = "Advanced options for Elasticsearch"
  type        = map(string)
  default     = {}
}