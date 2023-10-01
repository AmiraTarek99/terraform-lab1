resource "aws_instance" "bastion_instance" {
  ami           = "ami-03a6eaae9938c858c" 
  instance_type = "t2.micro"     
  key_name      = aws_key_pair.tf-keypair.id  
  associate_public_ip_address = true
  subnet_id     = aws_subnet.public-subnet-az1.id
  vpc_security_group_ids = [aws_security_group.public-sg.id]


  user_data = <<-EOF
                  #!/bin/bash
                  echo "${tls_private_key.mykeypair.private_key_pem}" >/home/ec2-user/private-key.pem
                  chmod 400 private-key.pem
               EOF
  tags = {
    Name = "bastion-instance"
  }
}