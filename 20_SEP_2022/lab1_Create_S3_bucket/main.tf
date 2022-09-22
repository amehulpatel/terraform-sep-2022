provider "aws"{
    region = "us-east-1"
}

resource "aws_s3_bucket" "mohini-bucket" {
  bucket = "my-tf-test-bucket-m1-sep"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}