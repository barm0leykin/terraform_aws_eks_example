## AWS
provider "aws" {
  region  = var.region
  # profile = "tv-akiyanov"
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

resource "aws_subnet" "eks-staging-private-a" {
  vpc_id                  = aws_vpc.eks-staging.id
  cidr_block              = "10.30.1.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${var.regions.virginia}a"

  tags = {
    Name = "eks-staging-private-a"
  }
}

resource "aws_subnet" "eks-staging-private-b" {
  vpc_id                  = aws_vpc.eks-staging.id
  cidr_block              = "10.30.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${var.regions.virginia}b"

  tags = {
    Name = "eks-staging-private-b"
  }
}

resource "aws_subnet" "eks-staging-public-a" {
  vpc_id                  = aws_vpc.eks-staging.id
  cidr_block              = "10.30.11.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.regions.virginia}a"

  tags = {
    Name = "eks-staging-public-a"
  }
}

resource "aws_subnet" "eks-staging-public-b" {
  vpc_id                  = aws_vpc.eks-staging.id
  cidr_block              = "10.30.12.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.regions.virginia}b"

  tags = {
    Name = "eks-staging-public-b"
  }
}

#########################
# output
