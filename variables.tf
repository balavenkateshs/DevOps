variable "accesskey" {
  type = "string"  
  description = "Access Key"
}
variable "secretkey" {
  type = "string"
  description = "Secreate Key"
}
variable "region" {
  type = "string"  
  default = "eu-west-1"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "subnet_cidr" {
  type = "list"
  default = ["10.0.1.0/28","10.0.1.16/28","10.0.1.32/28"]
}
data "aws_availability_zones" "available" {}


