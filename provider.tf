provider "aws" {
  access_key = "${var.accesskey}"
  secret_key = "${var.secretkey}"
  region = "${var.region}"
}
resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"
  tags {
   Name = "Main"
   Location = "Bangalore" 
  }
}
resource "aws_subnet" "subnet" {
  count = "${length(data.aws_availability_zones.available.names[0])}"
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${element(var.subnet_cidr, count.index)}"
  tags{
    Name = "Subnet-${count.index+1}"
  }
}
# terraform plan -var "accesskey=<Your access Key>" -var "secretkey=<your secreate Key>" .
