variable "aws-region" {
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
variable "instance-type" {
    description= "value"
    default= "t2.medium"
}
variable "subnet_id" {
    description= "value"
    default="subnet-0f87a45fe905355f1"
}
variable "instance-ami" {
 description=  "value"
 default= "ami-08e5424edfe926b43"
}
variable "instance-key-name"{
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
variable "snapshot_without_reboot" {
  default = "true"
}
variable "instance-tag-name"{
    description= "name of machine"
    default= "nowigence"
}
 variable "vpc_security_group_ids"{
     type = list(string)
    description= "name of vpc"
    default = ["vpc-017092b3559f639ed"]
 }