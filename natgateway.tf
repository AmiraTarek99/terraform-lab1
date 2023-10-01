# NAT Gateway
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.my-eip.id
  subnet_id     = aws_subnet.public-subnet-az1.id

  tags = {
    Name = "natgw"
  }

}

resource "aws_eip" "my-eip" {
   
   domain   = "vpc"
}