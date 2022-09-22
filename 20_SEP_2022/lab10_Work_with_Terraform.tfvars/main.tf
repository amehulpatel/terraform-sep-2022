provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "myawsserver1" {
  ami = var.image
  instance_type = var.hw
  key_name = "mohini-import"
  tags = {
      Name = "mohini-server1"
  }
}

resource "aws_instance" "myawsserver2" {
  ami = var.image
  instance_type = var.hw
  key_name = "mohini-import"
  tags = {
      Name = "mohini-server2"
  }
}
