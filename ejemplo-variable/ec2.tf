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
    Name = "sg-demo"
  }
}

resource "aws_instance" "ejemplo-ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "ejemplo-ec2"
  }
}