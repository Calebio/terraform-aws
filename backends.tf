terraform {
  cloud {
    organization = "Caleb-Terraform"

    workspaces {
      name = "caleb-aws-dev"
    }
  }
}