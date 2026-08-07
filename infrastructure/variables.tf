variable "aws_region" {
  description = "AWS Region used to deploy the project infrastructure."
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

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "subnet_config" {
  description = "Public and private subnet CIDRs mapped by Availability Zone."

  type = map(object({
    public_cidr  = string
    private_cidr = string
  }))
}