variable "project_name" {
  description = "Name of the project."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version used by the EKS cluster."
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs used by the EKS cluster."
  type        = list(string)
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "CIDR blocks allowed to access the public EKS API endpoint."
  type        = list(string)
}

variable "common_tags" {
  description = "Common tags applied to EKS resources."
  type        = map(string)
  default     = {}
}
#######################################################################################
variable "node_instance_type" {
  description = "EC2 instance type used by the EKS managed node group."
  type        = string
}

variable "node_desired_size" {
  description = "Desired number of worker nodes."
  type        = number
}

variable "node_min_size" {
  description = "Minimum number of worker nodes."
  type        = number
}

variable "node_max_size" {
  description = "Maximum number of worker nodes."
  type        = number
}
############################################
#--------- Azure DevOps EKS Access --------#
############################################

variable "azure_devops_role_name" {
  description = "Name of the existing Azure DevOps IAM role that requires access to this EKS cluster."
  type        = string
}