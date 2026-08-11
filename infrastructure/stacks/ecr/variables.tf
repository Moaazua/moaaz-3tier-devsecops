##########################################
#-------------- Variables --------------#
##########################################

variable "aws_region" {
  description = "AWS Region used to deploy the ECR repositories."
  type        = string
}

variable "project_name" {
  description = "Name of the project."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}