output "public_key" {
  value = tls_private_key.generated.public_key_openssh

}
output "private_key" {
  value = tls_private_key.generated.private_key_pem

}
