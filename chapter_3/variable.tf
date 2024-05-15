# global variable
## provider
variable "AWS_ACCESS_KEY" {
  type        = string
  description = "aws access key"
}

variable "AWS_SECRET_KEY" {
  type        = string
  description = "aws secret access key"
}

variable "AWS_KEY_NAME" {
  type        = string
  description = "aws key name"
}

variable "AWS_KEY_PATH" {
  type        = string
  description = "aws private key local path"
}



## region
variable "MAIN_1_REGION" {
  type        = string
  description = "main_1 region"
}

variable "MAIN_2_REGION" {
  type        = string
  description = "main_2 region - default region"
}

variable "MAIN_3_REGION" {
  type        = string
  description = "main_3 region"
}

# network variable
## vpc
variable "VPC_CIDR_BLOCK" {
  type        = string
  description = "vpc cidr address block"
}

## subnet cidr
## ======= public subnet ======= ##
variable "MAIN_PUBLIC_1_CIDR" {
  type        = string
  description = "main_public_1 subnet cidr block"
}

variable "MAIN_PUBLIC_2_CIDR" {
  type        = string
  description = "main_public_2 subnet cidr block"
}


variable "MAIN_PUBLIC_3_CIDR" {
  type        = string
  description = "main_public_3 subnet cidr block"
}


## ======= private subnet ======= ##
variable "MAIN_PRIVATE_1_CIDR" {
  type        = string
  description = "main_public_1 subnet cidr block"
}

variable "MAIN_PRIVATE_2_CIDR" {
  type        = string
  description = "main_public_2 subnet cidr block"
}


variable "MAIN_PRIVATE_3_CIDR" {
  type        = string
  description = "main_public_3 subnet cidr block"
}

## instance
variable "HOME_NETWORK_IP" {
  type        = string
  description = "my home network ip"
}

variable "INSTNACE_TYPE" {
  type        = string
  description = "test instance type"
}