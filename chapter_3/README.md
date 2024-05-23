# Terraform AWS code
## Requirement
terraform.tfvars 파일 생성

```bash
cat <<EOF> terraform.tfvars
# AWS credentials
AWS_ACCESS_KEY    = "your_aws_access_key"
AWS_SECRET_KEY    = "your_aws_secret_key"
AWS_KEY_NAME      = "your_aws_key_name"
AWS_KEY_PATH      = "your_aws_key_path"

# Regions
MAIN_1_REGION     = "us-west-1"
MAIN_2_REGION     = "us-west-2"
MAIN_3_REGION     = "us-east-1"

# Network variables
VPC_CIDR_BLOCK    = "10.0.0.0/16"

# Subnet CIDR blocks
MAIN_PUBLIC_1_CIDR  = "10.0.1.0/24"
MAIN_PUBLIC_2_CIDR  = "10.0.2.0/24"
MAIN_PUBLIC_3_CIDR  = "10.0.3.0/24"

MAIN_PRIVATE_1_CIDR = "10.0.101.0/24"
MAIN_PRIVATE_2_CIDR = "10.0.102.0/24"
MAIN_PRIVATE_3_CIDR = "10.0.103.0/24"

# Instance settings
HOME_NETWORK_IP   = "your_home_network_ip"
INSTNACE_TYPE     = "t2.micro"
EOF
```

terraform 모듈 초기화
```bash
terraform init
```