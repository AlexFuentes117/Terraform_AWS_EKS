module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1d"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  create_igw = true #Que las subnets publicas accesan a internet

  enable_nat_gateway     = true #Que las subnets privadas puedan salir a internet
  single_nat_gateway     = true #Para que cada subnet privada tenga un Nat Gateway 
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "prod"
    VPC        = "prod"
  }
}
