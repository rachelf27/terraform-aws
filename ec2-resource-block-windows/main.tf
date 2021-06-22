provider "aws" {
    region = "eu-west-1"
}

#Create the EC2 instance resource block.
resource "aws_instance" "windows" {
    ami = "ami-00044f922345e6b31"
    instance_type = "t2.micro"
}