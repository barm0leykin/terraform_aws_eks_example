## AWS
provider "aws" {
  region  = var.region
  profile = "default"
  shared_credentials_file = "~/.aws/credentials"
  }

resource "aws_vpc" "eks-staging" {
  cidr_block                       = "10.30.0.0/16"
  instance_tenancy                 = "default"
  enable_dns_support               = "true"
  enable_dns_hostnames             = "true"
  assign_generated_ipv6_cidr_block = "false"
  enable_classiclink               = "false"
  tags = {
    Name    = "eks-staging"
    Managed = "Terraform"
  }
}

resource "aws_subnet" "eks-staging-subnet-private-1" {
    vpc_id = aws_vpc.eks-staging.id
    cidr_block = "10.30.1.0/24"
    map_public_ip_on_launch = false
    availability_zone = "eu-central-1a"
    tags = {
        Name = "eks-staging-subnet-private-1"
        Managed = "Terraform"
    }
}

resource "aws_subnet" "eks-staging-subnet-private-2" {
    vpc_id = aws_vpc.eks-staging.id
    cidr_block = "10.30.2.0/24"
    map_public_ip_on_launch = false
    availability_zone = "eu-central-1b"
    tags = {
        Name = "eks-staging-subnet-private-1"
        Managed = "Terraform"
    }
}

resource "aws_subnet" "eks-staging-subnet-private-3" {
    vpc_id = aws_vpc.eks-staging.id
    cidr_block = "10.30.3.0/24"
    map_public_ip_on_launch = false
    availability_zone = "eu-central-1c"
    tags = {
        Name = "eks-staging-subnet-private-1"
        Managed = "Terraform"
    }
}
#########################
# output
