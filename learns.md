## Here I write about things that caught my interest or things I should remember

The resource block below will be explained

``` 
resource "aws_lb_target_group" "fv_tg" {
  name     = "fv-lb-tg${substr(uuid(), 0, 3)}" 
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id
  lifecycle {
    ignore_changes = [name] 
  }
  health_check {
    healthy_threshold   = var.lb_healthy_threshold
    unhealthy_threshold = var.lb_unhealthy_threshold
    timeout             = var.lb_timeout
    interval            = var.lb_interval
  }
}
```
For the name line, substr and uuid adds random strings to the name but the downside that everytime you run a terraform apply to the name is changed automatically and that can affect every instance in this target group so the solution here is to add the l`ifecycle` block and use the `ignore_changes` to specify what change should be ignored.