output "MAIN_VPC_ID" {
  value = aws_vpc.main.id
}

output "MAIN_1_PUBLIC_SUBNET_ID" {
  value = aws_subnet.main_public_1.id
}

output "MAIN_1_PRIVATE_SUBNET_ID" {
  value = aws_subnet.main_private_1.id
}