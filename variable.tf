variable "aws_region" {
  description = "The AWS region"
  default     = "ap-south-1"
}

variable "access_key" {
  description = "value"
  default     = ""
}

variable "secret_key" {
  description = "value"
  default     = ""
}

variable "instance_type" {
    description= "value"
    default= "t2.medium"
}

variable "subnet_id" {
    description= "value"
    default="subnet-015e1c11f94538c9b"
}

variable "instance_ami" {
 description=  "value"
 default= "ami-08e5424edfe926b43"
}

variable "application_name" {
 description=  "machine name"
 default= "Nowigence"
}

variable "instance_key_name"{
 description= "name of key"
 default = "nowigence-key"
}

variable "spot_price" {
  default = "0.03"
}

variable "spot_type" {
  description = "value"
  default     = "persistent"
}

variable "instance_tag_name"{
    description= "name of machine"
    default= "nowigence"
}