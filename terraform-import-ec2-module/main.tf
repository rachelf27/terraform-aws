provider "aws" {
    region = "us-east-1"
}

module "ec2_import" {
    source = "./ec2-module/"
}