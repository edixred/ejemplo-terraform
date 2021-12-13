terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}


provider "aws" {
  region                      = "us-east-1" # <<<<< Try changing this to eu-west-1 to compare the costs
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}


resource "aws_instance" "example" {
  ami           = "ami-0357d42faf6fa582f"
  instance_type = "t2.micro"
}