#Provider block
provider "aws" {
    region = "us-east-1"
}

#Your S3 Bucket code
resource "aws_s3_bucket" "test_bucket" {
  bucket = "tf-s3-bucket-rm"
  acl = "private"
}

#terraform import aws_s3_bucket.bucket bucket-name