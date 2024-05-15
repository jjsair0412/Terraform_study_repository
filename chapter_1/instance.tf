provider "aws" {
  access_key = ""
  secret_key = ""
  region = ""
}


resource "aws_instance" "example" {
  ami = "ami-07d95467596b97099"
  instance_type = "t2.micro"
}

