variable "aws-region" {
  description = "The AWS region"
  default     = "us-east-2"
}
variable "access_key" {
  description = "value"
  default     = ""

}


variable "secret_key" {
  description = "value"
  default     = ""
} 

variable "instance-ami" {
  description = "The AMI (Amazon Machine Image) that identifies the instance"
  default     = "ami-097f31fd706d98941"
}
# variable "vpc_security_group_ids" {
#    description = "The instance type to be used"
#    default     = "sg-02c878fd84c4f6de9"
#  }
 variable "vpc_security_group_ids" {
  type = map(list(string))
  default = {
    "default"     = ["sg-02c878fd84c4f6de9"]
    
  }
}
variable "subnet_id" {
  description = "The instance type to be used"
  default     = "subnet-f70f4dbb"
}

variable "instance-type" {
  description = "The instance type to be used"
  default     = "t3.small"
}

variable "instance-key-name" {
  description = "The name of the SSH key to associate to the instance. Note that the key must exist already."
  default     = "Saarthi-Compile-Code"
}


variable "instance-tag-name" {
  description = "instance-tag-name"
  default     = "Production node server_kaumudi"
}

variable "instance-associate-public-ip" {
  description = "Defines if the EC2 instance has a public IP address."
  default     = "true"
}

