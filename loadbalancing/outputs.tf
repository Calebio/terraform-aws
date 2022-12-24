# --- loadbalancing/outputs ---
output "lb_target_group_arn" {
  value       = aws_lb_target_group.fv_tg.arn
  description = "load balancer arn"
}

output "lb_endpoint" {
  value = aws_lb.fv_lb.dns_name
}