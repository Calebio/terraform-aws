# --- loadbalancing/outputs ---
output "lb_target_group_arn" {
  value       = aws_lb_target_group.fv_tg.arn
  description = "load balancer arn"
}
