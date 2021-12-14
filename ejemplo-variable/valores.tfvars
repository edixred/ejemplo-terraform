ami           = "ami-083654bd07b5da81d"
instance_type = "t2.micro"
tags          = { Name = "practica2", Environment = "Prod" }
sg_name       = "demo-securitygroup"

ingress_rules = [
  {
    from_port   = "22"
    to_port     = "22"
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