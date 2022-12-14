# --- Networking/main.tf ---

resource "random_integer" "rand_int" {
    min = 1
    max = 100
}

resource "aws_vpc" "full_vpc"{
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "calebs_full_vpc -${random_integer.rand_int.id}"
    }
}