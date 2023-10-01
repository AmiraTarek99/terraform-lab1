# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "public_subnet_az1_association" {
  subnet_id      = aws_subnet.public-subnet-az1.id
  route_table_id = aws_route_table.public-rt.id

}

resource "aws_route_table_association" "public_subnet_az2_association" {
  subnet_id      = aws_subnet.public-subnet-az2.id
  route_table_id = aws_route_table.public-rt.id
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private_subnet_az1_association" {
  subnet_id      = aws_subnet.private-subnet-az1.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private_subnet_az2_association" {
  subnet_id      = aws_subnet.private-subnet-az2.id
  route_table_id = aws_route_table.private-rt.id
}

# Route - Internet Gateway to Public Route Table
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.mygw.id
}

# Route - NAT Gateway to Private Route Table
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgw.id

}