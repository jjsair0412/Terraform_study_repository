resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "main_private_nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.main_public_1.id

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main_gw]
}

# private route table
resource "aws_route_table" "main_private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.main_private_nat.id
  }

  tags = {
    Name = "main-private-rt"
  }
}

## ====== routetalbe , subnet 연결 ====== ##
resource "aws_route_table_association" "main_private_1_a" {
  subnet_id      = aws_subnet.main_private_1.id
  route_table_id = aws_route_table.main_private.id
}


resource "aws_route_table_association" "main_private_2_a" {
  subnet_id      = aws_subnet.main_private_2.id
  route_table_id = aws_route_table.main_private.id
}


resource "aws_route_table_association" "main_private_3_a" {
  subnet_id      = aws_subnet.main_private_3.id
  route_table_id = aws_route_table.main_private.id
}