variable "env" {
  type = string
  description = "Provide Environment from  prod, test, dev :"
}

variable "poc" {
  type = bool
  default = true
}

resource "aws_instance" "myawsserver" {
  ami = "ami-0603cbe34fd08cb81"
  instance_type = "${ var.env == "prod" ? "t2.medium" : "t2.small" }"
  count = "${ var.poc == true ? 1 : 0 }"
  tags = {
    Name = "mohini-aws-ec2-instance"
    Env = var.env
    Owner = "Mohini"
  }
}