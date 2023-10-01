# Generate Private Key
resource "tls_private_key" "mykeypair" {
  algorithm = "RSA"
  rsa_bits  =4096
}

# Key Pair
resource "aws_key_pair" "tf-keypair" {
  key_name   = "tf-keypair"
  public_key =  tls_private_key.mykeypair.public_key_openssh
}

# Derive Public Key from Private Key
 resource "local_file" "tf-key" {
  content  = tls_private_key.mykeypair.private_key_pem
  filename = "tf-keypair.pem"
}