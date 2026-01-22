resource "aws_lb" "this" {
  name               = "alb-${var.environment}"
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = var.security_groups
}
