provider "aws" {
    region = "eu-west-1"
}

#Create an EC2 Resource Block
resource "aws_instance" "terraform-aws" {
  ami = "ami-0ac43988dfd31ab9a"
  instance_type = "t2.micro"
}