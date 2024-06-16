resource "aws_security_group" "example" {   
    name = "example"

    dynamic "ingress" {
        for_each = var.port
        content {
          from_port = ingress.key
          to_port = ingress.key # map의 key 할당
          cidr_blocks = ingress.value # map의 value 할당
          protocol = "tcp"
        }
    }
}
