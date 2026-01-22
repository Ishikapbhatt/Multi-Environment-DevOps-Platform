resource "aws_eks_cluster" "this" {
  name     = "eks-${var.environment}"
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.private_subnets
  }

  depends_on = [var.cluster_role_policy]
}
