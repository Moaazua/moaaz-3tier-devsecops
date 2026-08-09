variable "project_name" {
  description = "Name of the project."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster where add-ons will be installed."
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to EKS add-on IAM resources."
  type        = map(string)
  default     = {}
}
