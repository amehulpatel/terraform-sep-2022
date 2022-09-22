resource "aws_instance" "web" {
  ami           = "ami-05fa00d4c63e32376"
  instance_type = "t3.micro"
  #subnet_id = aws_subnet.main.id
  tags = {
    Name = "mohini-sep-20"
  }
}

provider "aws"{
    region = "us-east-1"
}

resource "aws_s3_bucket" "mohini-bucket" {
  bucket = "my-tf-test-bucket-mohini-sep"
  #defining explicit dependency that bucket will be created after instance and subnet is created
  depends_on = [aws_instance.web, aws_subnet.main ]
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = "vpc-048cc962cc50b2e3d"
  cidr_block = "10.0.110.0/24"

  tags = {
    Name = "mohini-private-subnet"
  }
}