resource "aws_eks_cluster" "main" {
  name     = "${var.project_name}-${var.environment}-eks"
  role_arn = aws_iam_role.eks_cluster.arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids = var.private_subnet_ids

    endpoint_private_access = true
    endpoint_public_access  = true

    public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  }

  access_config {
    authentication_mode                         = "API"
    bootstrap_cluster_creator_admin_permissions = true
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-eks"
    }
  )

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}