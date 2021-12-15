terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.69.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}


###-------Recursos


resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_security_group" "ssh_connection" {
  name   = var.sg_name
  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }

  }

  tags = {
    Name = "allow_tls"
  }
}

/*resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  tags            = var.tags
  security_groups = ["${aws_security_group.ssh_connection.name}"]
}*/

resource "aws_instance" "app_server" {
  
  ami             = var.ami_id
  instance_type   = var.instance_type

  tags = {
    Name = "ExampleAppServerInstance"
  }
}




## Variables ##########################
variable "ami_id" {
  default     = ""
  description = "AMI ID"
}

variable "instance_type" {
}

variable "tags" {
}

variable "sg_name" {
}

variable "ingress_rules" {
}

