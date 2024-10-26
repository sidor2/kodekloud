# Application Load Balancer (ALB)
resource "aws_lb" "ecs_alb" {
  name               = "${var.proj_name}-ecs-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = data.aws_subnets.default.ids  # Use the default subnets
}

# ALB Listener for port 80
resource "aws_lb_listener" "ecs_alb_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }
}

# Target Group for ALB
resource "aws_lb_target_group" "ecs_tg" {
  name     = "${var.proj_name}-ecs-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id  # Use the default VPC
  
  # Set the target type to 'ip' for awsvpc compatibility
  target_type = "ip"
}

# ALB Security Group
resource "aws_security_group" "alb_sg" {
  name        = "${var.proj_name}-alb-sg"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}