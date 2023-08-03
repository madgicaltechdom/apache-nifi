provider "aws" {
  region  = var.aws-region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "instance" {
  ami                         = "${var.instance-ami}"
  instance_type               = "${var.instance-type}"
  key_name                    = "${var.instance-key-name != "" ? var.instance-key-name : ""}"
  associate_public_ip_address = "${var.instance-associate-public-ip}"
  subnet_id                   = "${var.subnet_id}"
#vpc_security_group_ids      = ["${aws_security_group.sg.id}"]
 vpc_security_group_ids = var.vpc_security_group_ids["default"]
  tags = {
    Name = "${var.instance-tag-name}"
  }
}

