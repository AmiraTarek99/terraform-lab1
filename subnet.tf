resource "aws_subnet" "public-subnet-az1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a" 
  tags = {
    Name = "public-subnet-az1"
  }
}

# Private Subnets - Availability Zone 1
resource "aws_subnet" "private-subnet-az1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a" 
  tags = {
    Name = "private-subnet-az1"
  } 
}

# Public Subnets - Availability Zone 2
resource "aws_subnet" "public-subnet-az2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"  
  tags = {
    Name = "public-subnet-az2"
  }
}

# Private Subnets - Availability Zone 2
resource "aws_subnet" "private-subnet-az2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"  
  tags = {
    Name = "private-subnet-az2"
  }
}