module "server1" {
  source          = "../child-module"
  hw              = "t2.nano"
  name            = "mohini-prod"
  bucket_creation = true
  bucket_name     = "mohini-bucket1-prod-sep22"
}

module "server2" {
  source      = "../child-module"
  hw          = "t3.micro"
  name        = "mohini-test"
  bucket_creation = false
  bucket_name = "mohini-bucket2-prod-sep22"
}

# Working with terraform defined modules. Uncomment the below code and run the plan, to check for resource creation.

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"
#   version = "3.14.4"
#   name = "mohini-vpc"
#   cidr = "10.0.0.0/16"

#   azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = false
#   enable_vpn_gateway = false

#   tags = {
#     Terraform = "true"
#     Environment = "dev"
#     Client = "Vodafone"
#   }
# }
