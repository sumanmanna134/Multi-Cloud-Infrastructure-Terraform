output "aws_key_output_private_ip" {
  value     = { "private" = module.tls_private_key.private_key, "public" = module.tls_private_key.public_key }
  sensitive = true

}

output "phone_number" {
  value     = data.vault_generic_secret.phone_number
  sensitive = true

}
