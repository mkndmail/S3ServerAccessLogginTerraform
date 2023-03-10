variable "bucket_name_1" {
  type    = string
  default = "server-access-bucket-1"
}
variable "bucket_name_2" {
  type    = string
  default = "server-access-bucket-2"
}

variable "bucket_name_3" {
  type    = string
  default = "server-access-bucket-3"
}

variable "target_bucket" {
  type    = string
  default = "mkndmail-log-bucket"
}

locals {
  account_id = "746158423436"
  owner      = "Mukund Gururani"
  purpose    = "Server Access Logging Demo"
}



