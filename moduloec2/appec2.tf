provider "aws" {
  region = var.aws_region
}

module "app-ec2" {
	source = "github.com/muchikon/modulos-remotos/instance"
	ami_id = var.ami_id
	instance_type = var.instance_type
	tags = var.tags
	sg_name = var.sg_name
	ingress_rules = var.ingress_rules
}

