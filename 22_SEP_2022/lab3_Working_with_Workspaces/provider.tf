
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.3"
    }
  }
}
provider "aws" {
    region = "us-east-2"
}
