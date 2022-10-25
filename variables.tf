variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

locals {
  cluster_name = "eks-v2"
  tags = merge({
    Name = "EKS ${local.cluster_name}",
    "kubernetes.io/cluster/${local.cluster_name}": "owned"
  })
}
