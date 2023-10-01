# Security Group for SSH from 0.0.0.0/0
resource "aws_security_group" "public-sg" {
  name        = "ssh_from_anywhere"
  description = "Allow SSH from anywhere"  
  vpc_id = aws_vpc.myvpc.id
   
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH_From_Anywhere"
  }
}
# Security Group for SSH and Port 3000 from VPC CIDR
resource "aws_security_group" "private-sg" {
  name        = "ssh_and_port_3000_from_vpc"
  description = "Allow SSH and port 3000 from VPC CIDR"  
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "SSH_And_Port_3000_From_VPC"
  }
  ingress {
    
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.myvpc.cidr_block]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.myvpc.cidr_block]
  }


    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
