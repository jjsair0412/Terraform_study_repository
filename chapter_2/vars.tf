variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1      = "ami-0b0ea68c435eb488d"
    us-east-2      = "ami-05803413c51f242b7"
    ap-northeast-2 = "ami-07d95467596b97099"
  }
}

variable "AWS_REGION" {
  type    = string
  default = "ap-northeast-2"
}

variable "AWS_KEY_NAME" {
  type = string
}

variable "AWS_KEY_PATH" {
  type = string
}


variable "instance_username" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}