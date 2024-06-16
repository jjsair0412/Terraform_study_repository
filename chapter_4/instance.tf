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
  instance_type = "t2.micro"
  key_name      = var.AWS_KEY_NAME


  # VPC subnet
  subnet_id = var.ENV == "prod" ? module.vpc-prod.public_subnets[0] : module.vpc-dev.public_subnets[1]

  # security group
  vpc_security_group_ids = [
    var.ENV == "prod" ? module.allow-ssh-prod.this_security_group_id : module.allow-ssh-dev.this_security_group_id
  ]
  tags = {
    Name = "Hello_Terraform"
  }
}
