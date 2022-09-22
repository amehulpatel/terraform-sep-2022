provider "aws" {
    region = "us-east-2"
}

#Creating VPC
resource "aws_vpc" "v1" {

    cidr_block = "10.0.0.0/16"
    tags = {
    Name = "Mohini"
  }
}

#creating Subnet
resource "aws_subnet" "s1" {
  vpc_id     = aws_vpc.v1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Private-Mohini"
  }
}

#creating Key-Pair
resource "tls_private_key" "pk" {
  algorithm = "RSA"
}

#retriving private key locally
resource "local_file" "myprivatekey" {
  content  = tls_private_key.pk.private_key_pem
  filename = "myprivatekey1.pem"
} 

#creating key pair
resource "aws_key_pair" "pubkey" {
  key_name   = "mohini-21Sep"
  public_key = tls_private_key.pk.public_key_openssh
}

#retriving private key locally
resource "local_file" "mypublickey" {
  content  = tls_private_key.pk.public_key_openssh
  filename = "mypublickey.pem"
} 

#instnace creation
resource "aws_instance" "i1" {
  
  depends_on    = [
                aws_subnet.s1]
  ami           = var.ami_id
  instance_type = var.instancetype
  key_name      = aws_key_pair.pubkey.key_name
  subnet_id     = aws_subnet.s1.id
  tags = {
      Name = var.instance_name
      Environment = "dev"
  }
 }
