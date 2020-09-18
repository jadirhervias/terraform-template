// EC2
# variable "bucket_name" { default = "bucket-terraform-demo" }
# variable "acl" { default = "private" }
variable "ami_id" { description = "AMI ID" }
# default = "ami-0bcc094591f354be2" }
variable "instance_type" {
  description = "Instance type (EC2)"
  default     = "t2.micro"
}
variable "instance_tags" {
  description = "Instance(EC2) tags"
  type        = map
  default = {
    Name       = "Shopper_Demo_Infraestructure",
    Enviroment = "Development",
    Createby   = "Terraform"
  }
}
variable "bootstrap" { description = "configuration script" }
# variable "key_name" { description = "Current key pair in aws" }
// Security group
variable "sg_name" { description = "Security group name" }
variable "sg_description" { description = "Security group description" }
variable "sg_ingress_rules" {
  description = "Security group ingress rules"
  type        = list
}
variable "sg_tags" {
  description = "Security group tags"
  type        = map
}
