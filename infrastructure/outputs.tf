##########################################
#------------ ecr module ------------#
##########################################
output "frontend_ecr_repository_url" {
  description = "URL of the frontend ECR repository."
  value       = module.ecr.frontend_repository_url
}

output "backend_ecr_repository_url" {
  description = "URL of the backend ECR repository."
  value       = module.ecr.backend_repository_url
}