variable "hw" {
  type = string
  default = "t2.medium"
  description = "Provide Instance type of your server:"
}

variable "image" {
  default = "ami-063aa28b29dd9b827"
}
