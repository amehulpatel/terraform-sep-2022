variable "hw" {
  type    = string
  default = "t2.micro"
}

variable "image" {
  type    = string
  default = "ami-0568773882d492fc8"
}

variable "name" {
  type    = string
  default = "mohini"
}

variable "key-name" {
  type    = string
  default = "mohini-21Sep"
}

variable "bucket_name" {
  type = string
}

variable "bucket_creation" {
}