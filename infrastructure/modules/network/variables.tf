variable "project_name" {
  description = "Project name used in network resource names."
  type        = string
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
}

variable "vpc_cidr" {
  description = "IPv4 CIDR block assigned to the VPC."
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to network resources."
  type        = map(string)
  default     = {}
}