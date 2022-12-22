# -- Networking/outputs.tf ---

output "vpc_id" {
  value       = aws_vpc.full_vpc.id
  description = "output of the vpc id"
}

output "db_subnet_group_name" {
  value       = aws_db_subnet_group.fv_rds_subnet_group.*.name
  description = "output for subnet group name"
}

output "db_security_group" {
  value = [aws_security_group.fv_sg["rds"].id]
}

output "public_sg" {
  value = aws_security_group.fv_sg["public"].id
}

output "public_subnets" {
  value = aws_subnet.fv_public_subnet.*.id
}