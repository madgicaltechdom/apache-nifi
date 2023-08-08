provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_security_group" "webserver-security-group" {
  name        = "${var.application_name}-sg"
  description = "create the Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_spot_instance_request" "instance" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = var.instance_key_name
  subnet_id              = var.subnet_id
  spot_price             = var.spot_price
  vpc_security_group_ids = [aws_security_group.webserver-security-group.id]
  spot_type              = var.spot_type
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp3"
    volume_size = 16 # Replace with the desired volume size in GB
  }
  tags = {
    Name = "${var.instance_tag_name}"
  }
  depends_on = [aws_security_group.webserver-security-group]
}


