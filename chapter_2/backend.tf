// backend remote state를 AWS S3로 지정
terraform {
  backend "s3" {
    bucket = "jinseongstate"
    key    = "terraform/terraform.state"
    region = "ap-northeast-2"
  }

}