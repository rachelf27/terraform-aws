provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "var_instance_1" {
    ami = var.image_id
    instance_type = var.instance_type
    tags = {
        Name = "var_instance_1"
        environment = "stage"
    }
}

resource "aws_instance" "var_instance_2" {
    ami = var.image_id
    instance_type = var.instance_type
    tags = {
        Name = "var_instance_2"
        environment = "dev"
    }
}