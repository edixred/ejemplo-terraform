
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

tags    = { Name = "demo-tf", Environment = "demo" }
sg_name = "demo-sg"

ami_id        = "ami-2757f631"
instance_type = "t2.micro"