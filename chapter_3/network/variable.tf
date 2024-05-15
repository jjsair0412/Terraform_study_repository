# global
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
