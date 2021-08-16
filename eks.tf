#########

data "aws_eks_cluster" "k8s-staging" {
  name = module.eks-cluster.cluster_id
}

data "aws_eks_cluster_auth" "k8s-staging" {
  name = module.eks-cluster.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.k8s-staging.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.k8s-staging.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.k8s-staging.token
}

module "eks-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "staging"
  cluster_version = "1.21"
  vpc_id          = aws_vpc.eks-staging.id

  subnets         = [
    aws_subnet.eks-staging-subnet-private-1.id,
    aws_subnet.eks-staging-subnet-private-2.id,
    aws_subnet.eks-staging-subnet-private-3.id
  ]

  worker_groups = [
    {
      instance_type = "t3.medium"
      asg_max_size  = 2
    }
  ]
}
