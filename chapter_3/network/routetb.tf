# public route table
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_gw.id
  }

  tags = {
    Name = "main_public_rt"
  }
}

## ====== routetalbe , subnet 연결 ====== ##
resource "aws_route_table_association" "main_public_1_a" {
  subnet_id      = aws_subnet.main_public_1.id
  route_table_id = aws_route_table.main-public.id
}


resource "aws_route_table_association" "main_public_2_a" {
  subnet_id      = aws_subnet.main_public_2.id
  route_table_id = aws_route_table.main-public.id
}


resource "aws_route_table_association" "main_public_3_a" {
  subnet_id      = aws_subnet.main_public_3.id
  route_table_id = aws_route_table.main-public.id
}