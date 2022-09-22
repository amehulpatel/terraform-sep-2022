variable "env" {
  type = string
  description = "Provide Environment from  prod, test, dev :"
}

resource "aws_instance" "myawsserver" {
  ami = "ami-0603cbe34fd08cb81"
  instance_type = "${ var.env == "prod" ? "t2.medium" : "t2.small" }"

  tags = {
    Name = "mohini-aws-ec2-instance"
    Env = var.env
    Owner = "Mohini"
  }
}

output "myawsserver-ip" {
  value = aws_instance.myawsserver.public_ip
}

output "myserver-PrivateIP" {
  value = aws_instance.myawsserver.private_ip
}
