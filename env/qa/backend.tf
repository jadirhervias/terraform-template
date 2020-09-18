# terraform {
#   backend "s3" {
#     bucket  = "bucket-terraform-backend-demo"
#     key     = "env/qa"
#     region  = "us-east-1"
#     encrypt = true
#     # Enviar ARN del recurso que creó al archivo de estado
#     # kms_key_id = "arn:aws:kms:us-east-1:123739201177:key/bcdc2b7a-24a8-4ef1-bc66-3f6796ef1606"
#   }
# }
