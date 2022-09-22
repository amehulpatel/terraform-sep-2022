resource "aws_instance" "web" {
  ami           = "ami-0568773882d492fc8"
  instance_type = var.hw

  tags = {
    Name = "mohini-server1"
  }
}

# resource "aws_s3_bucket" "b" {
#   bucket = "mohini-bucket-1234"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }