#########

data "aws_eks_cluster" "k8s-staging" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "k8s-staging" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.k8s-staging.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.k8s-staging.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.k8s-staging.token
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "staging"
  cluster_version = "1.21"
  vpc_id          = aws_vpc.eks-staging.id

  subnets         = [
    aws_subnet.eks-staging-private-a.id,
    aws_subnet.eks-staging-private-b.id
  ]

  worker_groups = [
    {
      name          = "worker-group-1"
      instance_type = "t2.small"
      asg_max_size  = 2
      additional_security_group_ids = [aws_security_group.worker_group_1.id]
    }
  ]

  // node_groups_defaults = {
  //   ami_type  = "AL2_x86_64"
  //   disk_size = 15
  // }

  // node_groups = {
  //   main-node-group = {
  //     name_prefix = "eks-node-"
  //     desired_capacity = 1
  //     max_capacity     = 10
  //     min_capacity     = 1

  //     instance_types = ["t3.micro"]
  //     capacity_type  = "SPOT"
  //     k8s_labels = {
  //       Environment = "test"
  //       GithubRepo  = "terraform-aws-eks"
  //       GithubOrg   = "terraform-aws-modules"
  //     }
  //     additional_tags = {
  //       ExtraTag = "example"
  //     }
  //     taints = [
  //       {
  //         key    = "dedicated"
  //         value  = "gpuGroup"
  //         effect = "NO_SCHEDULE"
  //       }
  //     ]
  //   }
  // }

  // map_roles    = var.map_roles
  // map_users    = var.map_users
  // map_accounts = var.map_accounts

}
