#Variable for AZ
variable "availability_zone" {
    type = string
    default = "us-east-1a"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}