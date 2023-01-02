resource "aws_s3_bucket_versioning" "versioning" {
  bucket = var.bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}