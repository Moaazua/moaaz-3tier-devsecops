locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

##########################################
#------------ Network Module -----------#
##########################################

module "network" {
  source = "./modules/network"

  project_name  = var.project_name
  environment   = var.environment
  vpc_cidr      = var.vpc_cidr
  subnet_config = var.subnet_config
  common_tags   = local.common_tags
}

##########################################
#-------------- EKS Module -------------#
##########################################

module "eks" {
  source = "./modules/eks"

  project_name                         = var.project_name
  environment                          = var.environment
  kubernetes_version                   = var.kubernetes_version
  private_subnet_ids                   = module.network.private_subnet_ids
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  node_instance_type                   = var.node_instance_type
  node_desired_size                    = var.node_desired_size
  node_min_size                        = var.node_min_size
  node_max_size                        = var.node_max_size
  azure_devops_role_name               = var.azure_devops_role_name
  common_tags                          = local.common_tags
}

##########################################
#----------- EKS Addons Module ---------#
##########################################

module "eks_addons" {
  source = "./modules/eks-addons"

  project_name = var.project_name
  environment  = var.environment
  cluster_name = module.eks.cluster_name
  common_tags  = local.common_tags

  depends_on = [module.eks]
}