terraform {
  backend "remote" {
    organization = "your_TFC_organization_name"

    workspaces {
      name = "your_TFC_workspace_name"
    }
  }
}

variable "access_key" {}
variable "secret_key" {}
variable "instance_type" {}
variable "region" {}
variable "amis" {
  type = "map"
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = var.instance_type
}

output "public_dns" {
  value = aws_instance.example.public_dns
}


