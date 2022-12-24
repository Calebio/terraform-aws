# ---compute/output.tf ---

output "instance" {
  value = aws_instance.fv_node[*]
}

output "instance_port" {
  value = aws_lb_target_group_attachment.fv_tg_attach[0].port
}