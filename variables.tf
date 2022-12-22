# --- root/variables.tf ---

variable "aws_region" {
  default     = "us-west-2"
  description = "aws regions"
}

variable "access_ip" {
  type = string
}

# --- database variables ---
variable "dbname" {
  type = string
}
variable "dbuser" {
  type      = string
  sensitive = true
}
variable "dbpass" {
  type      = string
  sensitive = true
}