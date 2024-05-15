resource "aws_instance" "example" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  # securityGroup IP 개수 초기화되어 ip range 지정안됨
  # security_groups = [aws_security_group.form_korea.name]

  key_name = var.AWS_KEY_NAME

  // 프로비저닝되는 인스턴스 내부에 파일 업로드
  // 앤서블 스크립트 등을 업로드해서 , 소프트웨어 배포 자동화 가능
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"

    connection {
      type        = "ssh"
      user        = var.instance_username
      private_key = file("${var.AWS_KEY_PATH}")
      host        = self.public_ip
    }
  }

  // ssh 연결 후 해당 파일 실행
  // self 키워드는 자기 자신
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
    connection {
      type        = "ssh"
      user        = var.instance_username
      private_key = file("${var.AWS_KEY_PATH}")
      host        = self.public_ip
    }
  }

  // terraform 명령어 수행하는 local에서 수행
  // terraform 으로 "example" 이름으로 프로비저닝한 인스턴스의 private_ip , public_ip 를 로컬의 파일에 저장
  // local-exec 리소스는 해당 리소스(local-exec을 수행하는 리소스) 의 상태가 변경되는것이 아니라면, 동작하지 않음.
  // 따라서 local-exec 리소스는 테라폼이 처음 동작할때만 동작하거나 , 리소스 상태가 변경되었을때만 동작함.
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"
  }
}

output "ip" {
  value = aws_instance.example.public_ip
}