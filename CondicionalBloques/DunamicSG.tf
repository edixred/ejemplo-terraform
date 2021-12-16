
## Ejemplo bloque dynamico - Grupos de seguridad 
locals {
  ports = [80, 81, 8080, 22, 443]
}

resource "aws_security_group" "simple" {

  name        = "demo-dynamicblock-simple"
  description = "demo-dynamicblock-simple"

  dynamic "ingress" {
    for_each = local.ports
    content {
      description = "Servicio ${ingress.key}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
}

## Ejemplo condicion - recurso usuarios
variable "condicion" {
  default = "SI"
}

resource "aws_iam_user" "example" {
  count = 3
  name  = var.condicion == "SI" ?  "si-cumple-${count.index}" : "no-${count.index}"
  
}

# Ejemplo creacion de instancias ec2
resource "aws_instance" "app_server" {

  count         = 2
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  tags = {
    Name = "demo-ec2-${count.index}"
  }
}