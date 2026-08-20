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
########################################
#------- eks -------#
########################################
variable "kubernetes_version" {
  description = "Kubernetes version used by the EKS cluster."
  type        = string
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "CIDR blocks allowed to access the public EKS API endpoint."
  type        = list(string)
}

variable "node_instance_type" {
  description = "EC2 instance type used by the EKS managed node group."
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of EKS worker nodes."
  type        = number
}

variable "node_min_size" {
  description = "Minimum number of EKS worker nodes."
  type        = number
}

variable "node_max_size" {
  description = "Maximum number of EKS worker nodes."
  type        = number
}
########################################
#------- Azure DevOps EKS Access ------#
########################################

variable "azure_devops_role_name" {
  description = "Existing IAM role assumed by Azure DevOps for ECR push and EKS deployment."
  type        = string
}