#모듈을 이용한 방식
module "allow-ssh-prod" {
  source  = "terraform-aws-modules/security-group/aws" #사용할 모듈 소스
  version = "3.1.0"                                    #모듈 버전

  name            = "prod"                 #그룹이름
  description     = "prod"                 #설명
  vpc_id          = module.vpc-prod.vpc_id #생성할 위치의 VPC ID
  use_name_prefix = "false"                #해당 옵션을 false 시키지 않을 경우, 그룹이름 뒤에 고유 넘버링이 부착되어 생성됨
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0           #아웃바운드 시작 포트
      to_port     = 0           #아웃바운드 끝나는 포트
      protocol    = "-1"        #사용할 프로토콜
      description = "all"       #설명
      cidr_blocks = "0.0.0.0/0" #허용할 IP 범위
    }
  ]
}

#모듈을 이용한 방식
module "allow-ssh-dev" {
  source  = "terraform-aws-modules/security-group/aws" #사용할 모듈 소스
  version = "3.1.0"                                    #모듈 버전

  name            = "dev"                 #그룹이름
  description     = "dev"                 #설명
  vpc_id          = module.vpc-dev.vpc_id #생성할 위치의 VPC ID
  use_name_prefix = "false"               #해당 옵션을 false 시키지 않을 경우, 그룹이름 뒤에 고유 넘버링이 부착되어 생성됨
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0           #아웃바운드 시작 포트
      to_port     = 0           #아웃바운드 끝나는 포트
      protocol    = "-1"        #사용할 프로토콜
      description = "all"       #설명
      cidr_blocks = "0.0.0.0/0" #허용할 IP 범위
    }
  ]
}

# Outputs
output "prod_security_group_id" {
  value = module.allow-ssh-prod.this_security_group_id
}

output "dev_security_group_id" {
  value = module.allow-ssh-dev.this_security_group_id
}