resource "aws_lb_target_group" "blue" {
  name     = "tg-blue-${var.environment}"
  port     = 80
  protocol = "HTTP"
  vpc_id  = var.vpc_id
}

resource "aws_lb_target_group" "green" {
  name     = "tg-green-${var.environment}"
  port     = 80
  protocol = "HTTP"
  vpc_id  = var.vpc_id
}
