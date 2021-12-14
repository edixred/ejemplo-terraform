terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}


provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

resource "aws_instance" "example" {
  ami           = "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
}

Variable "my_var" {
              Type = string
              Description = “a variable to create a string to configure some stuff”
              Default = “this is a string to configure some stuff”
              }