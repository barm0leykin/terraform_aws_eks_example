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
  version         = "18.2.3"
  # version         = "17.4.0"
  cluster_name    = local.cluster_name
  cluster_version = "1.23"
  vpc_id          = aws_vpc.eks-staging.id

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_enabled_log_types = ["api","audit","authenticator","controllerManager","scheduler"]

  cluster_addons = {
    # coredns = {
    #   resolve_conflicts = "OVERWRITE"
    # }
    kube-proxy = {
      resolve_conflicts = "OVERWRITE"
    }
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  subnet_ids         = [
    aws_subnet.eks-staging-private-a.id,
    aws_subnet.eks-staging-private-b.id
  ]


  # Self Managed Node Group(s)
  self_managed_node_group_defaults = {
    instance_type                          = "m5.large"
    update_launch_template_default_version = true
    iam_role_additional_policies           = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
  }

  self_managed_node_groups = {
    one = {
      name = "eks-spot-1"

      public_ip    = true
      max_size     = 5
      desired_size = 1

      use_mixed_instances_policy = true
      mixed_instances_policy = {
        instances_distribution = {
          on_demand_base_capacity                  = 0
          on_demand_percentage_above_base_capacity = 10
          spot_allocation_strategy                 = "capacity-optimized"
        }

        override = [
          {
            instance_type     = "m5.large"
            weighted_capacity = "1"
          },
          {
            instance_type     = "m6i.large"
            weighted_capacity = "2"
          },
        ]
      }

      # pre_bootstrap_user_data = <<-EOT
      # echo "foo"
      # export FOO=bar
      # EOT

      # bootstrap_extra_args = "--kubelet-extra-args '--node-labels=node.kubernetes.io/lifecycle=spot'"

      # post_bootstrap_user_data = <<-EOT
      # cd /tmp
      # sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
      # sudo systemctl enable amazon-ssm-agent
      # sudo systemctl start amazon-ssm-agent
      # EOT
    }
  }

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    disk_size              = 50
    instance_types         = ["t3.large", "m6i.large", "m5.large", "m5n.large", "m5zn.large"]
    vpc_security_group_ids = [aws_security_group.worker_group_1.id]
  }

  eks_managed_node_groups = {
    eks-ng-1 = {
      public_ip    = true
      name         = "eks-ng-1"
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = ["t3.medium"]
      capacity_type  = "SPOT"
      labels = {
        Environment = "test"
        GithubRepo  = "terraform-aws-eks"
        GithubOrg   = "terraform-aws-modules"
      }
      taints = {
        dedicated = {
          key    = "dedicated"
          value  = "gpuGroup"
          effect = "NO_SCHEDULE"
        }
      }
      tags = {
        ExtraTag = "example"
      }
    }
  }

}
