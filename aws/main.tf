terraform {
  backend "s3" {
    bucket         = "terraform-state-ghm"
    key            = "dev/aws_infra"
    region         = "ap-south-1"
    dynamodb_table = "tf-lock"
    encrypt        = true
  }
  # backend "remote" {
  #   hostname     = "app.terraform.io"
  #   organization = "hilledge"
  #   workspaces {
  #     name = "multi-cloud"
  #   }

  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.60.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.1.0"
    }
  }
}

locals {
  tags = {
    "infraby" = "terraform"
  }
}
module "elb" {
  source            = "../modules/aws-modules/elb"
  availability_zone = var.availability_zone
  tags              = local.tags

}


module "tls_private_key" {
  source = "../modules/private_key"
}

module "aws_key_pair" {
  source     = "../modules/aws-modules/key_pair"
  public_key = module.tls_private_key.public_key
  tags       = local.tags

}

# module "vault" {
#   source      = "../modules/vault"
#   vault_token = var.token

# }

module "s3" {
  source      = "../modules/aws-modules/s3"
  bucket_name = var.bucket_name
}

resource "aws_iam_policy" "iam_policy" {
  name        = "data_bucket_policy"
  description = "Allow Access To Bucket"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:Get*",
          "s3:List*"
        ],
        "Resource" : "${data.aws_s3_bucket.data_bucket.arn}"
      }
    ]
  })



}





