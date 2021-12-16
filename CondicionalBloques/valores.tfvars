/*
ingress_rules = [
  {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

tags    = { Name = "pruebaTerraform", Environment = "prueba" }
sg_name = "prueba1"

ami_id        = "ami-2757f631"
instance_type = "t2.micro"*/