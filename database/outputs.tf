# --- database/outputs ---
output "db_endpoint" {
  value = aws_db_instance.fv_db.endpoint
}