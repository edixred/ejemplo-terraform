
output "stack_id" {
  description = "prefijo del recurso que se creó en el despliegue"
  value       = var.stack_id
}

output "tag_vpc" {
  description = "etiqueta de la VPC creada"
  value       = module.vpc.one_nat_gateway_per_az
}

output "name_vpc" {
  description = "nombre vpc"
  value       = module.vpc.name
}

