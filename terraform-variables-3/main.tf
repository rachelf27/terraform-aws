provider "aws" {
    region = var.region
}

resource "aws_instance" "var_instance_1" {
    ami = var.image_id
    instance_type = var.instance_type
    tags = var.tags
}
