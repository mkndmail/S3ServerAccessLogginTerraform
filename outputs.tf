output "bucket_1_details" {
  description = "Name of Bucket 1"
  value       = aws_s3_bucket.bucket_3.id
  #  zone= aws_s3_bucket.bucket_3.hosted_zone_id
  #  logging= aws_s3_bucket.bucket_1.logging
}

output "bucket_2_details" {
  description = "Name of Bucket 2"
  value       = aws_s3_bucket.bucket_2.id
  #  zone= aws_s3_bucket.bucket_2.hosted_zone_id
  #  logging= aws_s3_bucket.bucket_1.logging
}

output "bucket_3_details" {
  description = "Name of Bucket 3"
  value       = aws_s3_bucket.bucket_3.id
  #  zone= aws_s3_bucket.bucket_3.hosted_zone_id
  #  logging= aws_s3_bucket.bucket_3.logging
}

output "bucket_1_loggin_prefix" {
  value = aws_s3_bucket.bucket_1.logging[0].target_prefix
}

output "bucket_1_name" {
  value = aws_s3_bucket.bucket_1.logging[0].target_bucket
}