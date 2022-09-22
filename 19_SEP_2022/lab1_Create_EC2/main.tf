provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "s1" {
  ami           = "ami-002070d43b0a4f171"
  instance_type = "t3.micro"
  tags = {
    Name = "Mohini-server"
    env  = "dev"
  }
}