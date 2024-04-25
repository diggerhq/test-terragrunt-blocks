variable "cluster_name" {
  description = "Name of the cluster to deploy to"
  type        = string
}

variable "environment" {
  description = "Environment of the projects"
  type        = string
}

variable "unique_id" {
  description = "Unique baseproject instance ID"
  type        = string
  default     = ""
}
