variable "region" {
  // default = "eu-central-1"
  default = "us-east-1"
}

variable "regions" {
  type = map(string)
  default = {
    ohio       = "us-east-2"
    virginia   = "us-east-1"
    california = "us-west-1"
    oregon     = "us-west-2"
    frankfurt  = "eu-central-1"
    stockholm  = "eu-north-1"
  }
}


locals {
  cluster_name = "aws-tf-test"
}
