variable "aws_region" {
  description = "AWS Region where the Terraform state bucket will be created."
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  description = "Project name used to construct the Terraform state bucket name."
  type        = string
  default     = "moaaz-3tier-devsecops"
}

variable "environment" {
  description = "Environment name associated with the Terraform state."
  type        = string
  default     = "dev"
}