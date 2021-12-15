variable "AWS_ASSUME_ROLE_ARN" {
  type        = string
  description = "The ARN of the role to assume"
}

variable "AWS_ASSUME_ROLE_SESSION_NAME" {
  type        = string
  description = "The session name to use when making the AssumeRole call"
}

variable "AWS_ASSUME_ROLE_EXTERNAL_ID" {
  type        = string
  description = "The external ID to use when making the AssumeRole call"
}

variable "stack_id" {
  type        = string
  description = "Prefijo para identificar el recurso creado"
}

variable "aws_region" {
  default     = "us-east-1"
  description = "region donde el recurso será desplegado"
}

variable "vpc_config" {
  type        = any
  description = "Configuracion de VPC"
}

variable "number_instances" {
  type        = number
  description = "Cantidad de instancias ec2 a ser creadas"
  default     = 1
}

variable "eks_roles_secrets" {
  type        = list(any)
  description = "Lista de Roles ARN para el modulo EKS External Secrets"
}

variable "ec2_name" {
  type        = string
  description = "Nombre intancia EC2"
}
