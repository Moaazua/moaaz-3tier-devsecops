##########################################
#------------ Common Tags --------------#
##########################################

locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

##########################################
#------------- ECR Module --------------#
##########################################

module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  environment  = var.environment
  common_tags  = local.common_tags
}