terraform {
  required_version = ">= 1.0.0"
  # remote terraform state on Terraform Cloud. Token: ~/.terraformrc
  // backend "remote" {
  //   organization = "barm0leykino"
  //   workspaces {
  //     name = "aws-example"
  //   }
  // }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.53"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.4.1"
    }
  }
}
