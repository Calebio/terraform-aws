# ---Loadbalancing/main.tf ---

resource "aws_lb" "fv_lb" {
  name            = "fv-loadbalancer"
  subnets         = var.public_subnets
  security_groups = [var.public_sg]
  idle_timeout    = 400
}

resource "aws_lb_target_group" "fv_tg" {
  name     = "fv-lb-tg${substr(uuid(), 0, 3)}" #Add a random string from the uuid fucntion to the name!
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id
  lifecycle {
    ignore_changes = [name]
    creat_before_destroy = true 
  }
  health_check {
    healthy_threshold   = var.lb_healthy_threshold
    unhealthy_threshold = var.lb_unhealthy_threshold
    timeout             = var.lb_timeout
    interval            = var.lb_interval
  }
}

resource "aws_lb_listener" "fv_lb_listener" {
  load_balancer_arn = aws_lb.fv_lb.arn
  port              = var.listener_port     #80
  protocol          = var.listener_protocol #"HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.fv_tg.arn
  }
}