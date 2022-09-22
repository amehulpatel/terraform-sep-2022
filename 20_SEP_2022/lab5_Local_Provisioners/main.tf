provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t3.micro"
  tags = {
    Name = "mohini-sep-20"
  }
  
  # Create ip_address file and print the Ip address of instnace and hello message
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.private_ip} >> ./ip_address && echo hello"
  }
}