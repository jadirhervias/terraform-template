# Ejecución con AWS - Profile Default
provider "aws" {
  region  = "us-east-1"
  version = "~> 3.0"
}

# Modulo para el backend (S3)

# Modulo de la instancia EC2
module "app-shopper-ec2" {
  source        = "../../modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  sg_name       = var.sg_name
  ingress_rule  = var.ingress_rule
  key_name      = var.key_name
  bootstrap     = var.bootstrap
  tags          = var.tags
}

output "ip_ec2" { value = module.app-demo-ec2.instance_ip }
