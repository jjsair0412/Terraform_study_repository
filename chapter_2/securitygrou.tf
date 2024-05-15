// ap-northeast-1, ap-northeast-2 리전의 ec2, cloudfront ip를 가져와서 80포트를 허용함
# securityGroup IP 개수 초기화되어 ip range 지정안됨
# data "aws_ip_ranges" "korea_ec2" {
#     regions = ["ap-northeast-1", "ap-northeast-2"]
#     services = ["ec2"]
# }

# resource "aws_security_group" "form_korea" {
#   name = "from_korea"
#   ingress {
#     from_port        = "80"
#     to_port          = "80"
#     protocol         = "tcp"
#     cidr_blocks      = data.aws_ip_ranges.korea_ec2.cidr_blocks
#     ipv6_cidr_blocks = data.aws_ip_ranges.korea_ec2.ipv6_cidr_blocks
#   }

#   tags = {
#     CreateDate = data.aws_ip_ranges.korea_ec2.create_date
#     SyncToken  = data.aws_ip_ranges.korea_ec2.sync_token
#   }
# }