# Public Route Table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "public-rt"
  }
}

# Private Route Table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.myvpc.id
    tags = {
    Name = "private-rt"
  }
}
