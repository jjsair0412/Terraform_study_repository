variable "HOME_NETWORK_IP" {
  type        = string
  description = "my home network ip"
}

variable "AWS_KEY_NAME" {
  type        = string
  description = "aws private key name"
}

variable "INSTNACE_TYPE" {
  type        = string
  description = "test instance type"
}

# network output
variable "MAIN_VPC_ID" {
  type        = string
  description = "main vpc id"
}

variable "MAIN_1_PUBLIC_SUBNET_ID" {
  type        = string
  description = "public subnet id"
}


variable "MAIN_1_PRIVATE_SUBNET_ID" {
  type        = string
  description = "private subnet id"
}