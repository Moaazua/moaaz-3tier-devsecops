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
##########################################
#------------ eks module ------------#
##########################################
output "eks_cluster_name" {
  description = "Name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint of the EKS Kubernetes API server."
  value       = module.eks.cluster_endpoint
}