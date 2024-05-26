# instance variable
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

variable "VOLUME_AZ" {
  type = string
  description = "aws test instance ebs az"

}

variable "VOLUME_SIZE" {
  type = string
  description = "aws test instance volume size"
}

variable "VOLUME_INSTANCE_DEVICE_NAME" {
  type = string
  default = "/dev/xvdh"
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

variable "MAIN_2_REGION" {
  type = string
  description = "region name - default region"
  
}