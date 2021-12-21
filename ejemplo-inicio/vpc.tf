module "vpc" {
  name                     = "${var.stack_id}-vpc"
  cidr                     = var.vpc_config["cidr"]
  dhcp_options_ntp_servers = var.vpc_config["ntp_servers"]
  one_nat_gateway_per_az       = try(var.vpc_config["one_nat_gateway_per_az"], true)
  enable_vpn_gateway           = false
  enable_dhcp_options          = true
  enable_dns_hostnames         = true
}

module "vpc_logs" {
  stack_id = var.stack_id
  ec2_name = var.ec2_name
}

