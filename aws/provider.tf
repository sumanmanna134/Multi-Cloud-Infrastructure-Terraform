provider "aws" {
  shared_credentials_files = ["${local.aws_credentials_file}"]

}

locals {
  aws_credentials_file = "${var.HOME}/.aws/credentials"
}
output "aws_credentials_file_path" {
  value = local.aws_credentials_file
}
