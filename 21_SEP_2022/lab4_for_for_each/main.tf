provider "aws" {
  region = "us-east-2"
}

variable "server_names" {
  description = "Create virtual machines with these names"
  type        = list(string)
  default     = [ "server-1", "server2"]
}

variable "tags" {
  description = "map"
  type        = map(string)
  default     = {
    env      = "test"
    owner  = "mohini"
    dept   = "pcs"
    client = "vodafone"
  }
}

resource "aws_instance" "myawsserver" {
  ami = "ami-0603cbe34fd08cb81"
  instance_type = "t2.micro"
  key_name = "test1"
  for_each = toset(var.server_names)
  tags = {
   for key, value in var.tags :
    key => value
  }
}

output "Private-IP" {
# As for_each loop is a map, you have to modify the syntax to get the values printed
 value = {
  for instance in aws_instance.myawsserver:
    instance.id => instance.private_ip
 }
}

output "string-print" {
  value = [for first, second in var.tags : "${first} is having value ${second}"]
}