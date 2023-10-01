resource "aws_instance" "application_instance" {
  ami           = "ami-03a6eaae9938c858c"  
  instance_type = "t2.micro"     
  key_name      = aws_key_pair.tf-keypair.id   

  subnet_id     = aws_subnet.private-subnet-az1.id
  vpc_security_group_ids = [aws_security_group.private-sg.id]

  tags = {
    Name = "application-instance"
  }
}



