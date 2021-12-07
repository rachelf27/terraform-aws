#Your S3 Bucket code
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl = "private"
}

#terraform import module.s3_bucket_import.aws_s3_bucket.s3_bucket s3-module-rm-bucket