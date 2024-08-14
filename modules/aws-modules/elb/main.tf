resource "aws_ebs_volume" "elb" {
  availability_zone = var.availability_zone
  size              = 40
  tags              = var.tags

}
