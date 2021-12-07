#Remote Backend Configuration
#https://www.terraform.io/docs/language/settings/backends/remote.html
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "RachelMurphy"

    workspaces {
      name = "terraform_cloud_aws"
    }
  }
}

#Provider Configuration
provider "aws" {
  region = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

#S3 Bucket Configuration
resource "aws_s3_bucket" "cloud_s3_bucket" {
    bucket_prefix = "test-"
}
