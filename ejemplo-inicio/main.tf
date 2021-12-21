terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}


provider "aws" {
  region                      = var.aws_region
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

resource "aws_instance" "example" {
  ami           = "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
}
