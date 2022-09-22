# Creating Instance in region us-east-1 with provider alias a.

resource "aws_instance" "myawsserver1" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
  provider = aws.a
  key_name = "mohini-import"
  tags = {
      Name = "mohini-server1"
  }
}

# Creating Instance in region us-east-2 with provider alias b.

resource "aws_instance" "myawsserver2" {
  ami = "ami-063aa28b29dd9b827"
  instance_type = "t2.micro"
  provider = aws.b
  tags = {
      Name = "mohini-server2"
  }
}

