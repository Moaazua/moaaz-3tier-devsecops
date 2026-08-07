locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
##########################################
#------------ network module ------------#
##########################################
module "network" {
  source = "./modules/network"

  project_name  = var.project_name
  environment   = var.environment
  vpc_cidr      = var.vpc_cidr
  subnet_config = var.subnet_config
  common_tags   = local.common_tags
}