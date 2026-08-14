#######################################
#---------- VPC CNI role ------------#
#######################################

resource "aws_iam_role" "vpc_cni" {
  name = "${var.project_name}-${var.environment}-vpc-cni-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "pods.eks.amazonaws.com"
        }

        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
      }
    ]
  })

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-vpc-cni-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "vpc_cni" {
  role       = aws_iam_role.vpc_cni.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}


#######################################
#---------- EBS CSI role ------------#
#######################################

resource "aws_iam_role" "ebs_csi" {
  name = "${var.project_name}-${var.environment}-ebs-csi-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "pods.eks.amazonaws.com"
        }

        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
      }
    ]
  })

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-ebs-csi-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "ebs_csi" {
  role       = aws_iam_role.ebs_csi.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEBSCSIDriverPolicyV2"
}

############################################
#---- AWS Load Balancer Controller role ---#
############################################

resource "aws_iam_role" "aws_load_balancer_controller" {
  name = "${var.project_name}-${var.environment}-aws-lbc-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "pods.eks.amazonaws.com"
        }

        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
      }
    ]
  })

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-aws-lbc-role"
    }
  )
}

resource "aws_iam_policy" "aws_load_balancer_controller" {
  name = "${var.project_name}-${var.environment}-aws-lbc-policy"

  policy = file(
    "${path.module}/aws-load-balancer-controller-iam-policy.json"
  )
}

resource "aws_iam_role_policy_attachment" "aws_load_balancer_controller" {
  role       = aws_iam_role.aws_load_balancer_controller.name
  policy_arn = aws_iam_policy.aws_load_balancer_controller.arn
}