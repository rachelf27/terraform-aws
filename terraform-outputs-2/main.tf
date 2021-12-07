provider "aws" {
    region = var.region
}

resource "aws_instance" "outputs_instance_1" {
    ami = var.image_id
    instance_type = var.instance_type
    tags = {
        Name = "outputs_instance_1"
        environment = "dev_1"
    }
}

resource "aws_instance" "outputs_instance_2" {
    ami = var.image_id
    instance_type = var.instance_type
    tags = {
        Name = "outputs_instance_2"
        environment = "dev_2"
    }
}