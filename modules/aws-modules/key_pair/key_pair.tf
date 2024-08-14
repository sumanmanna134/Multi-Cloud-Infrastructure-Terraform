resource "aws_key_pair" "keypair" {
  key_name   = "MyKey"
  public_key = var.public_key
  lifecycle {
    ignore_changes = [key_name]
  }
  tags = var.tags
}
