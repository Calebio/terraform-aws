# --- root/variables.tf ---

variable "aws_region" {
  default     = "us-west-2"
  description = "aws regions"
}

variable "access_ip" {
  type = string
}