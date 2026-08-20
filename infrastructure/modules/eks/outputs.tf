output "cluster_name" {
  description = "Name of the EKS cluster."
  value       = aws_eks_cluster.main.name
}

output "cluster_arn" {
  description = "ARN of the EKS cluster."
  value       = aws_eks_cluster.main.arn
}

output "cluster_endpoint" {
  description = "Endpoint of the EKS Kubernetes API server."
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_security_group_id" {
  description = "Security group created by EKS for the cluster."
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

output "cluster_oidc_issuer_url" {
  description = "OIDC issuer URL of the EKS cluster."
  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

output "node_group_name" {
  description = "Name of the EKS managed node group."
  value       = aws_eks_node_group.main.node_group_name
}

output "node_role_arn" {
  description = "ARN of the IAM role used by EKS worker nodes."
  value       = aws_iam_role.eks_nodes.arn
}