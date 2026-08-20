############################################
#------- Azure DevOps Existing Role -------#
############################################

data "aws_iam_role" "azure_devops" {
  name = var.azure_devops_role_name
}

############################################
#------- AWS EKS Describe Permission ------#
############################################

resource "aws_iam_role_policy" "azure_devops_eks_describe" {
  name = "AzureDevOpsEKSDeployAccess"
  role = data.aws_iam_role.azure_devops.name

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "DescribeRuntimeEKSCluster"
        Effect = "Allow"

        Action = [
          "eks:DescribeCluster"
        ]

        Resource = aws_eks_cluster.main.arn
      }
    ]
  })
}

############################################
#----------- EKS Access Entry -------------#
############################################

resource "aws_eks_access_entry" "azure_devops" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = data.aws_iam_role.azure_devops.arn
  type          = "STANDARD"
}

############################################
#------- EKS Cluster Admin Access ---------#
############################################

resource "aws_eks_access_policy_association" "azure_devops_cluster_admin" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = aws_eks_access_entry.azure_devops.principal_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}