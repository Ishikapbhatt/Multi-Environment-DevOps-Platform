resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "ng-${var.environment}"
  node_role_arn  = var.node_role_arn
  subnet_ids     = var.private_subnets

  scaling_config {
    desired_size = var.environment == "prod" ? 3 : 2
    max_size     = var.environment == "prod" ? 5 : 3
    min_size     = 1
  }

  instance_types = ["t3.medium"]
}
