#################################################
#--------vpc variables------#
#################################################
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
#################################################
#----------subnets variables ----------------#
#################################################
variable "subnet_config" {
  description = "Public and private subnet CIDRs mapped by Availability Zone."

  type = map(object({
    public_cidr  = string
    private_cidr = string
  }))
}
