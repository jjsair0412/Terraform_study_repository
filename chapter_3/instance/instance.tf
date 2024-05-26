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
  user_data =  "${data.template_cloudinit_config.cloudinit-example.rendered}"

  subnet_id = var.MAIN_1_PUBLIC_SUBNET_ID

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id
  ]

  tags = {
    Name = "Hello_Terraform"
  }
}


resource "aws_ebs_volume" "test_volume" {
  availability_zone = var.VOLUME_AZ
  size              = var.VOLUME_SIZE
  type = "gp2"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = var.VOLUME_INSTANCE_DEVICE_NAME
  volume_id   = aws_ebs_volume.test_volume.id
  instance_id = aws_instance.was.id
}
