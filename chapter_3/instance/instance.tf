data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "was" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.INSTNACE_TYPE
  key_name      = var.AWS_KEY_NAME

  subnet_id = var.MAIN_1_PUBLIC_SUBNET_ID

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id
  ]

  tags = {
    Name = "Hello_Terraform"
  }
}