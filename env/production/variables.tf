variable "bucket_name" { default = "bucket-shopper-demo" }
variable "acl" { default = "private" }
variable "tags" { default = { Name = "Shopper Demo Infraestructure", Enviroment = "Development", Createby = "Terraform" } }
variable "ami_id" { default = "ami-0bcc094591f354be2" }
variable "instance_type" { default = "t2.micro" }
variable "sg_name" { description = "Nombre del Security Group" }
variable "ingress_rule" { description = "Reglas de ingreso" }
variable "key_name" { description = "Key Pair Existente" }
variable "bootstrap" { description = "Script de configuración" }
