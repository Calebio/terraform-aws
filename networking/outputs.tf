# -- Networking/outputs.tf ---

output vpc_id {
  value       = aws_vpc.full_vpc.id
  description = "output of the vpc id"
}
