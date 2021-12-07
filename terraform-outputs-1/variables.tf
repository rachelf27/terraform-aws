variable "region" {
    type = string
    default = "us-east-1"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "image_id" {
    type = string
    default = "ami-0ab4d1e9cf9a1215a"
}