variable "project_name" {
  description = "Name of the project."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to ECR repositories."
  type        = map(string)
  default     = {}
}