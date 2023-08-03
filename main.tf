provider "aws" {
  region  = var.aws-region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_spot_instance_request" "instance" {
  ami                         = "${var.instance-ami}"
  instance_type               = "${var.instance-type}"
  key_name                    = "${var.instance-key-name != "" ? var.instance-key-name : ""}"
  subnet_id                   = "${var.subnet_id}"
 spot_price    = "${var.spot_price }"
spot_type  = "${var.spot_type}"
#vpc_security_group_ids      = ["${aws_security_group.sg.id}"]
#  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "${var.instance-tag-name}"
  }
}


