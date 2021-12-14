stack_id = "cuenta-prueba-develop"

vpc_config = {
  cidr                   = "10.161.24.0/21"
  azs_number             = 2
  newbits                = 2
  private_net            = "10.161.24.0/23"
  public_net             = "10.161.25.128/25"
  eks_net                = "10.161.24.0/21"
  one_nat_gateway_per_az = false
  single_nat_gateway     = true
  ntp_servers            = ["186.155.28.147"]
}

number_instances = 5

ec2_name = "intance-example"

