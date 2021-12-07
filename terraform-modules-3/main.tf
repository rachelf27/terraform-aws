#Provider Block
provider "aws" {
    region = "us-east-1"
}


#EC2 Module Block
module "linux"{
    source = "./ec2-module/"
    availability_zone = "us-east-1a"
}