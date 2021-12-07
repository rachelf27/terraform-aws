provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "var_instance_1" {
    ami = "ami-0ab4d1e9cf9a1215a"
    instance_type = var.instance_type
    tags = {
        Name = "var_instance_1"
        environment = "stage"
    }
}

resource "aws_instance" "var_instance_2" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = var.instance_type
    tags = {
        Name = "var_instance_2"
        environment = "dev"
    }
}