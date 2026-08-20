output "addon_arns" {
  description = "ARNs of the EKS managed add-ons."

  value = {
    pod_identity_agent = aws_eks_addon.pod_identity_agent.arn
    vpc_cni            = aws_eks_addon.vpc_cni.arn
    coredns            = aws_eks_addon.coredns.arn
    kube_proxy         = aws_eks_addon.kube_proxy.arn
    ebs_csi            = aws_eks_addon.ebs_csi.arn
  }
}