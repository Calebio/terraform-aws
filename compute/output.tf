# ---compute/output.tf ---

output "instance"{
    value = aws_instance.fv_node[*]
}

output "tg_port"{
    value = var.tg_port
}