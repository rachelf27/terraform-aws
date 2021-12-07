provider "aws" {
    region = "us-east-1"
}

module "s3_bucket_import" {
    source = "./ec2-module/"
}