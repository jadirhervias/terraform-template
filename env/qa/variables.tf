variable "bucket_name" { default = "bucket-terraform-demo" }
variable "acl" { default = "private" }
variable "tags" { default = { Name = "Demo4", Enviroment = "Dev", Createby = "Terraform" } }
variable "ami_id" { default = "ami-0bcc094591f354be2" }
variable "instance_type" { default = "t2.micro" }
variable "sg_name" { description = "Nombre del Security Group" }
variable "ingress_rule" { description = "Reglas de ingreso" }
variable "key_name" { description = "Key Pair Exitente" }
variable "bootstrap" { description = "Scrip de configuración" }
