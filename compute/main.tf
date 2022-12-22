# ---compute/main.tf ---

data "aws_ami" "server_ami" {
  most_recent = true # in most cases you might be required to take speciific versions so watch out

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}