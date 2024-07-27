terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.60.0"
    }
  }
}

module "elb" {
  source            = "../modules/aws-modules/elb"
  availability_zone = var.availability_zone

}
