terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.15.0"
    }
    kubernetes = {
      version = "2.12.1"
    }
    helm = {
      version = "2.7.1"
    }
    # random = {
    #   source  = "hashicorp/random"
    #   version = "3.1.0"
    # }
  }

  required_version = "~> 1.3.0"
}
