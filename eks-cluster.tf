module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"

  cluster_name    = local.cluster_name
  cluster_version = "1.23"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  
  cluster_additional_security_group_ids = [aws_security_group.eks.id]

#  depends_on = [ aws_iam_policy.eks-ebs-sci-driver ]

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {
      resolve_conflicts = "OVERWRITE"
    }
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
    aws-ebs-csi-driver = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

    attach_cluster_primary_security_group = true

    # Disabling and using externally provided security groups
    create_security_group = false
  }

  eks_managed_node_groups = {
    one = {
      name = "eks-node-group-1"
      public_ip = true

      instance_types = ["t3.large"]

      min_size     = 1
      max_size     = 10
      desired_size = 1

      pre_bootstrap_user_data = <<-EOT
      echo 'foo bar'
      EOT

      vpc_security_group_ids = [
        aws_security_group.node_group.id
      ]
      
      iam_role_additional_policies            = [ "arn:aws:iam::691889635880:policy/eks-ebs-sci-driver" ]
      # iam_role_additional_policies            = [ aws_iam_policy.eks-ebs-sci-driver.arn ]
    }
    # tags = local.tags
  }
  
  
  # self_managed_node_group_defaults = {
  #   ami_type                                = "BOTTLEROCKET_x86_64"
  #   instance_type                           = "t3.large"
  #   disk_size                               = 50
  #   update_launch_template_default_version  = true
  #   iam_role_additional_policies            = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
  # }

  # self_managed_node_groups = {
  #   one = {
  #     name = "eks-spot-1"
  #     ami_type       = "BOTTLEROCKET_x86_64"
  #     capacity_type  = "SPOT"

  #     public_ip    = true
  #     max_size     = 5
  #     desired_size = 1

  #     use_mixed_instances_policy = true
  #     mixed_instances_policy = {
  #       instances_distribution = {
  #         on_demand_base_capacity                  = 0
  #         on_demand_percentage_above_base_capacity = 10
  #         spot_allocation_strategy                 = "capacity-optimized"
  #       }

  #       override = [
  #         {
  #           instance_type     = "t3.medium"
  #           weighted_capacity = "1"
  #         },
  #         {
  #           instance_type     = "t3.large"
  #           weighted_capacity = "2"
  #         },
  #       ]
  #     }

  #     # pre_bootstrap_user_data = <<-EOT
  #     # echo "foo"
  #     # export FOO=bar
  #     # EOT

  #     # bootstrap_extra_args = "--kubelet-extra-args '--node-labels=node.kubernetes.io/lifecycle=spot'"

  #     # post_bootstrap_user_data = <<-EOT
  #     # cd /tmp
  #     # sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
  #     # sudo systemctl enable amazon-ssm-agent
  #     # sudo systemctl start amazon-ssm-agent
  #     # EOT
  #   }
  # }
  
  # tags = local.tags
}
