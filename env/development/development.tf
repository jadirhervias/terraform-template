# Definicion del provider y resources
# Ejecución con Localstack
# EE.UU. Este (Norte de Virginia)us-east-1
# EE.UU. Este (Ohio)us-east-2
# EE.UU. Oeste (Norte de California)us-west-1
# EE.UU. Oeste (Oregón)us-west-2
provider "aws" {
  access_key                  = "admin"
  secret_key                  = "admin"
  region                      = "us-east-1" # Norte de Virginia
  version                     = "~> 3.0"
  profile                     = "localstack"
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2            = "http://localhost:4597"
    apigateway     = "http://localhost:4567"
    iam            = "http://localhost:4593"
    s3             = "http://localhost:4572"
    secretsmanager = "http://localhost:4584"
    sns            = "http://localhost:4575"
    sqs            = "http://localhost:4576"
    kms            = "http://localhost:4599"
  }
}

# Modulo para el backend (S3)

# Modulo de la instancia EC2
module "app_shopper_ec2" {
  source        = "../../modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_tags = var.instance_tags
  bootstrap     = var.bootstrap
  # key_name         = var.key_name
  sg_name          = var.sg_name
  sg_description   = var.sg_description
  sg_ingress_rules = var.sg_ingress_rules
  sg_tags          = var.sg_tags
}

// This output catch the output named "instance_ip" of the module app_shopper_ec2
output "ip_ec2" { value = module.app_shopper_ec2.instance_ip }
