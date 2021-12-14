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



###-------Recursos

resource "aws_security_group" "ssh_connection" {
  name = var.sg_name

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

resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  tags            = var.tags
  security_groups = ["${aws_security_group.ssh_connection.name}"]
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

variable "aws_region" {
  default     = "us-east-2"
  description = "region donde el recurso será desplegado"
}
