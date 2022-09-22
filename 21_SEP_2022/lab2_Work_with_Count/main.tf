provider "aws" {
  region = "us-east-2"
}

variable "server_names" {
  description = "Create virtual machines with these names"
  type        = list(string)
  default     = ["mohini-server1", "mohini-server2"]
}

resource "aws_instance" "myawsserver" {
  ami = "ami-0603cbe34fd08cb81"
  instance_type = "t2.nano"
 # key_name = "test1"
  count = length(var.server_names)
  tags = {
    Name = var.server_names[count.index]
    env = "test"
  }
}

output "Private-IP" {
 value = aws_instance.myawsserver[*].private_ip
}