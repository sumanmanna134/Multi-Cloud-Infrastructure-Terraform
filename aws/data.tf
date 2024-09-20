# data "vault_generic_secret" "phone_number" {
#   path = "secret/apps"

# }

data "aws_s3_bucket" "data_bucket" {
  depends_on = [module.s3]
  bucket     = var.bucket_name
}

