
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}



resource "aws_s3_bucket" "bucket_1" {
  bucket = var.bucket_name_1

  tags = {
    Name        = "logging"
    Environment = "Dev-${var.bucket_name_1}"
    owner       = local.owner
    purpose     = local.purpose
  }
}
resource "aws_s3_bucket" "bucket_2" {
  bucket = var.bucket_name_2

  tags = {
    Name        = "logging"
    Environment = "Dev-${var.bucket_name_2}"
    owner       = local.owner
    purpose     = local.purpose
  }
}
resource "aws_s3_bucket" "bucket_3" {
  bucket = var.bucket_name_3

  tags = {
    Name        = "logging"
    Environment = "Dev-${var.bucket_name_3}"
    owner       = local.owner
    purpose     = local.purpose
  }
}

resource "aws_s3_bucket_acl" "bucket_1" {
  bucket = aws_s3_bucket.bucket_1.id
  acl    = "private"
}
resource "aws_s3_bucket_acl" "bucket_2" {
  bucket = aws_s3_bucket.bucket_2.id
  acl    = "private"
}
resource "aws_s3_bucket_acl" "bucket_3" {
  bucket = aws_s3_bucket.bucket_3.id
  acl    = "private"
}

#resource "aws_s3_bucket" "log_bucket" {
#  bucket = "mkndmail-demo-bucket"
#  versioning {
#    enabled = true
#  }
#}
#
#resource "aws_s3_bucket_acl" "log_bucket_acl" {
#  bucket = aws_s3_bucket.log_bucket.id
#  acl    = "log-delivery-write"
#}

#resource "aws_s3_bucket_logging" "bucket_1_logging" {
#
#  bucket        = aws_s3_bucket.bucket_1.id
#  target_bucket = aws_s3_bucket.log_bucket.id
#  target_prefix = "log/${var.bucket_name_1}/"
#}
#
#resource "aws_s3_bucket_logging" "bucket_2_logging" {
#
#  bucket        = aws_s3_bucket.bucket_2.id
#  target_bucket = aws_s3_bucket.log_bucket.id
#  target_prefix = "log/${var.bucket_name_2}/"
#}
#
#resource "aws_s3_bucket_logging" "bucket_3_logging" {
#
#  bucket        = aws_s3_bucket.bucket_3.id
#  target_bucket = aws_s3_bucket.log_bucket.id
#  target_prefix = "log/${var.bucket_name_3}/"
#}

#module "server_access_logging_bucket1" {
#  source = ""
#
#}

module "server_access_logging_bucket1" {
  source             = "./modules/server-access-loggings3"
  source_bucket_name = var.bucket_name_1
  target_bucket_name = var.target_bucket
}
module "server_access_logging_bucket2" {
  source             = "./modules/server-access-loggings3"
  source_bucket_name = var.bucket_name_2
  target_bucket_name = var.target_bucket
  #  bucket_target_prefix = var.bucket_name_2
}
module "server_access_logging_bucket3" {
  source             = "./modules/server-access-loggings3"
  source_bucket_name = var.bucket_name_3
  target_bucket_name = var.target_bucket
}

module "versioning_bucket_1" {
  source      = "./modules/s3-versioning"
  bucket_name = var.bucket_name_1
}
module "versioning_bucket_2" {
  source      = "./modules/s3-versioning"
  bucket_name = var.bucket_name_2
  #  bucket_name = "${local.account_id}-var.bucket_name_2"
}
module "versioning_bucket_3" {
  source      = "./modules/s3-versioning"
  bucket_name = var.bucket_name_3
  #  bucket_name = "${local.account_id}-var.bucket_name_3"
}
