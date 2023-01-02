resource "aws_s3_bucket_logging" "bucket_3_logging" {
  bucket        = var.source_bucket_name
  target_bucket = var.target_bucket_name
  target_prefix = "log/${var.source_bucket_name}/"
}