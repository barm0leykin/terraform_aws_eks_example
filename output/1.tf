# aws_subnet.eks-staging-subnet-private-1:
resource "aws_subnet" "eks-staging-subnet-private-1" {
    arn                             = "arn:aws:ec2:eu-central-1:801983320073:subnet/subnet-04b3d9a45b92d785e"
    assign_ipv6_address_on_creation = false
    availability_zone               = "eu-central-1a"
    availability_zone_id            = "euc1-az2"
    cidr_block                      = "10.30.1.0/24"
    id                              = "subnet-04b3d9a45b92d785e"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = false
    owner_id                        = "801983320073"
    tags                            = {
        "Managed" = "Terraform"
        "Name"    = "eks-staging-subnet-private-1"
    }
    tags_all                        = {
        "Managed" = "Terraform"
        "Name"    = "eks-staging-subnet-private-1"
    }
    vpc_id                          = "vpc-081d24a4ddacd1ee4"
}

# aws_subnet.eks-staging-subnet-private-2:
resource "aws_subnet" "eks-staging-subnet-private-2" {
    arn                             = "arn:aws:ec2:eu-central-1:801983320073:subnet/subnet-080fdd6d114ac0006"
    assign_ipv6_address_on_creation = false
    availability_zone               = "eu-central-1b"
    availability_zone_id            = "euc1-az3"
    cidr_block                      = "10.30.2.0/24"
    id                              = "subnet-080fdd6d114ac0006"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = false
    owner_id                        = "801983320073"
    tags                            = {
        "Managed" = "Terraform"
        "Name"    = "eks-staging-subnet-private-1"
    }
    tags_all                        = {
        "Managed" = "Terraform"
        "Name"    = "eks-staging-subnet-private-1"
    }
    vpc_id                          = "vpc-081d24a4ddacd1ee4"
}

# aws_subnet.eks-staging-subnet-private-3:
resource "aws_subnet" "eks-staging-subnet-private-3" {
    arn                             = "arn:aws:ec2:eu-central-1:801983320073:subnet/subnet-00c5740a767a96283"
    assign_ipv6_address_on_creation = false
    availability_zone               = "eu-central-1c"
    availability_zone_id            = "euc1-az1"
    cidr_block                      = "10.30.3.0/24"
    id                              = "subnet-00c5740a767a96283"
    map_customer_owned_ip_on_launch = false
    map_public_ip_on_launch         = false
    owner_id                        = "801983320073"
    tags                            = {
        "Managed" = "Terraform"
        "Name"    = "eks-staging-subnet-private-1"
    }
    tags_all                        = {
        "Managed" = "Terraform"
        "Name"    = "eks-staging-subnet-private-1"
    }
    vpc_id                          = "vpc-081d24a4ddacd1ee4"
}

# aws_vpc.eks-staging:
resource "aws_vpc" "eks-staging" {
    arn                              = "arn:aws:ec2:eu-central-1:801983320073:vpc/vpc-081d24a4ddacd1ee4"
    assign_generated_ipv6_cidr_block = false
    cidr_block                       = "10.30.0.0/16"
    default_network_acl_id           = "acl-0e523dccede81016e"
    default_route_table_id           = "rtb-01b20f0efc32d7d08"
    default_security_group_id        = "sg-027410c3515688c75"
    dhcp_options_id                  = "dopt-a22ee5c8"
    enable_classiclink               = false
    enable_dns_hostnames             = true
    enable_dns_support               = true
    id                               = "vpc-081d24a4ddacd1ee4"
    instance_tenancy                 = "default"
    main_route_table_id              = "rtb-01b20f0efc32d7d08"
    owner_id                         = "801983320073"
    tags                             = {
        "Managed" = "Terraform"
        "Name"    = "eks-staging"
    }
    tags_all                         = {
        "Managed" = "Terraform"
        "Name"    = "eks-staging"
    }
}

# data.aws_eks_cluster.k8s-staging:
data "aws_eks_cluster" "k8s-staging" {
    arn                       = "arn:aws:eks:eu-central-1:801983320073:cluster/staging"
    certificate_authority     = [
        {
            data = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM1ekNDQWMrZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeE1EZ3dOakE1TURBME1sb1hEVE14TURnd05EQTVNREEwTWxvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBT2V2ClBLajdtS2UyeFk4TVUydVcwT25GM0tRdTZ1akpXeDY2Q3kxcklGMFZQRHkvS2hQcUlvNzVrMnd4R1pyTi90R2cKdVBOdUNicEFwV0YrNzRsUjhKOVllejI1K3Y2Tlk3V0gyNzQ1VzY2eTcrSTdjT3RKeHZUY3k2RjRGczQxbkM5eApPL3FUdWZXSWhSUmhXUEtkQWZrWXdVNTFrTXE4MXJSY0JENnUzbjIvY2x3aVYwaktBYU9ERUJTZ09hcWdXdE5ECkJOMVNyMEx4akZ5SXRWQVNZd1JiQm1rNFlMVk1VUncyakFGQmw2aWlDOVlTa0xtYXFtYXl3VzlzTk1HZEVkc3AKWXkxa2hMWjM5cHFSRVI4c2EvK3BXYXhkUnhmb0FQVTF0TkRINUEvU21CVHNYMjExT2VmVHl4VVYyTzJVMG9IQgpnbEFsVkE1eVQ1VFJGbTZhRzhzQ0F3RUFBYU5DTUVBd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZORlJBVHRFMVpHK2M0a3RjRlpUUXNjU1l5VlFNQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFBWFF5bS9kVldGdzZKL1E0b3RxR3BjU0x2L25JeWZaTDkxTXFodFlETllpV1MyZ0R3YQpuNTc3Q09vSC84K0hjTDBQUnRGZHk4blVzZ3hSa01rek5RczVQVUhmaklIN2pURnN5REp5OHBMVGg4RS9HZ0lOCi9EUUxpdGlkQ3h2ZmY2bTI3dEFoR01ZSThEMHo0S3N0L3QxT0JSbWE3R3VIV1lZNUwzdzBuVkNrTlhPeGhRRmEKNkxXcVhqcGkwQ0FmK0hGMkZ5czVmRHptaURiWGl3YjErdWxxaFRENmx3eFpRQWd2aFJQQUFremlKM00ydCtINAp4Q2ViM0ltTmhxaVB6ODg0ZGhTVGQzQ0pwdmMzTHdZWlk2Mk5qRUFjODc1eVIyKzFQaUlmaTJ1cmNwa3I5dFdUCnVWZ01CQU0xMGFXa2hGcUpVOWlhSGZlcXNiWnQ0cUNnSG5OQQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
        },
    ]
    created_at                = "2021-08-06 08:54:15.892 +0000 UTC"
    enabled_cluster_log_types = []
    endpoint                  = "https://1FBF81E9D095CB14B47DBD2E88793EEB.gr7.eu-central-1.eks.amazonaws.com"
    id                        = "staging"
    identity                  = [
        {
            oidc = [
                {
                    issuer = "https://oidc.eks.eu-central-1.amazonaws.com/id/1FBF81E9D095CB14B47DBD2E88793EEB"
                },
            ]
        },
    ]
    kubernetes_network_config = [
        {
            service_ipv4_cidr = "172.20.0.0/16"
        },
    ]
    name                      = "staging"
    platform_version          = "eks.2"
    role_arn                  = "arn:aws:iam::801983320073:role/staging20210806085255755900000002"
    status                    = "ACTIVE"
    tags                      = {}
    version                   = "1.20"
    vpc_config                = [
        {
            cluster_security_group_id = "sg-044bc43093735aeb0"
            endpoint_private_access   = false
            endpoint_public_access    = true
            public_access_cidrs       = [
                "0.0.0.0/0",
            ]
            security_group_ids        = [
                "sg-00bea0f7b97faf915",
            ]
            subnet_ids                = [
                "subnet-00c5740a767a96283",
                "subnet-04b3d9a45b92d785e",
                "subnet-080fdd6d114ac0006",
            ]
            vpc_id                    = "vpc-081d24a4ddacd1ee4"
        },
    ]
}

# data.aws_eks_cluster_auth.k8s-staging:
data "aws_eks_cluster_auth" "k8s-staging" {
    id    = "staging"
    name  = "staging"
    token = (sensitive value)
}


# module.eks-cluster.aws_autoscaling_group.workers[0]:
resource "aws_autoscaling_group" "workers" {
    arn                       = "arn:aws:autoscaling:eu-central-1:801983320073:autoScalingGroup:8d0d412c-4532-413f-bfe0-f0b53f0b7ecf:autoScalingGroupName/staging-020210806095927261000000002"
    availability_zones        = [
        "eu-central-1a",
        "eu-central-1b",
        "eu-central-1c",
    ]
    capacity_rebalance        = false
    default_cooldown          = 300
    desired_capacity          = 1
    force_delete              = false
    force_delete_warm_pool    = false
    health_check_grace_period = 300
    health_check_type         = "EC2"
    id                        = "staging-020210806095927261000000002"
    launch_configuration      = "staging-020210806095925682500000001"
    max_instance_lifetime     = 0
    max_size                  = 3
    metrics_granularity       = "1Minute"
    min_size                  = 1
    name                      = "staging-020210806095927261000000002"
    name_prefix               = "staging-0"
    protect_from_scale_in     = false
    service_linked_role_arn   = "arn:aws:iam::801983320073:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
    suspended_processes       = [
        "AZRebalance",
    ]
    termination_policies      = []
    vpc_zone_identifier       = [
        "subnet-00c5740a767a96283",
        "subnet-04b3d9a45b92d785e",
        "subnet-080fdd6d114ac0006",
    ]
    wait_for_capacity_timeout = "10m"

    tag {
        key                 = "Name"
        propagate_at_launch = true
        value               = "staging-0-eks_asg"
    }
    tag {
        key                 = "k8s.io/cluster/staging"
        propagate_at_launch = true
        value               = "owned"
    }
    tag {
        key                 = "kubernetes.io/cluster/staging"
        propagate_at_launch = true
        value               = "owned"
    }
}

# module.eks-cluster.aws_eks_cluster.this[0]:
resource "aws_eks_cluster" "this" {
    arn                       = "arn:aws:eks:eu-central-1:801983320073:cluster/staging"
    certificate_authority     = [
        {
            data = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM1ekNDQWMrZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeE1EZ3dOakE1TURBME1sb1hEVE14TURnd05EQTVNREEwTWxvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBT2V2ClBLajdtS2UyeFk4TVUydVcwT25GM0tRdTZ1akpXeDY2Q3kxcklGMFZQRHkvS2hQcUlvNzVrMnd4R1pyTi90R2cKdVBOdUNicEFwV0YrNzRsUjhKOVllejI1K3Y2Tlk3V0gyNzQ1VzY2eTcrSTdjT3RKeHZUY3k2RjRGczQxbkM5eApPL3FUdWZXSWhSUmhXUEtkQWZrWXdVNTFrTXE4MXJSY0JENnUzbjIvY2x3aVYwaktBYU9ERUJTZ09hcWdXdE5ECkJOMVNyMEx4akZ5SXRWQVNZd1JiQm1rNFlMVk1VUncyakFGQmw2aWlDOVlTa0xtYXFtYXl3VzlzTk1HZEVkc3AKWXkxa2hMWjM5cHFSRVI4c2EvK3BXYXhkUnhmb0FQVTF0TkRINUEvU21CVHNYMjExT2VmVHl4VVYyTzJVMG9IQgpnbEFsVkE1eVQ1VFJGbTZhRzhzQ0F3RUFBYU5DTUVBd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZORlJBVHRFMVpHK2M0a3RjRlpUUXNjU1l5VlFNQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFBWFF5bS9kVldGdzZKL1E0b3RxR3BjU0x2L25JeWZaTDkxTXFodFlETllpV1MyZ0R3YQpuNTc3Q09vSC84K0hjTDBQUnRGZHk4blVzZ3hSa01rek5RczVQVUhmaklIN2pURnN5REp5OHBMVGg4RS9HZ0lOCi9EUUxpdGlkQ3h2ZmY2bTI3dEFoR01ZSThEMHo0S3N0L3QxT0JSbWE3R3VIV1lZNUwzdzBuVkNrTlhPeGhRRmEKNkxXcVhqcGkwQ0FmK0hGMkZ5czVmRHptaURiWGl3YjErdWxxaFRENmx3eFpRQWd2aFJQQUFremlKM00ydCtINAp4Q2ViM0ltTmhxaVB6ODg0ZGhTVGQzQ0pwdmMzTHdZWlk2Mk5qRUFjODc1eVIyKzFQaUlmaTJ1cmNwa3I5dFdUCnVWZ01CQU0xMGFXa2hGcUpVOWlhSGZlcXNiWnQ0cUNnSG5OQQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg=="
        },
    ]
    created_at                = "2021-08-06 08:54:15.892 +0000 UTC"
    enabled_cluster_log_types = []
    endpoint                  = "https://1FBF81E9D095CB14B47DBD2E88793EEB.gr7.eu-central-1.eks.amazonaws.com"
    id                        = "staging"
    identity                  = [
        {
            oidc = [
                {
                    issuer = "https://oidc.eks.eu-central-1.amazonaws.com/id/1FBF81E9D095CB14B47DBD2E88793EEB"
                },
            ]
        },
    ]
    name                      = "staging"
    platform_version          = "eks.2"
    role_arn                  = "arn:aws:iam::801983320073:role/staging20210806085255755900000002"
    status                    = "ACTIVE"
    tags                      = {}
    tags_all                  = {}
    version                   = "1.20"

    kubernetes_network_config {
        service_ipv4_cidr = "172.20.0.0/16"
    }

    timeouts {
        create = "30m"
        delete = "15m"
    }

    vpc_config {
        cluster_security_group_id = "sg-044bc43093735aeb0"
        endpoint_private_access   = false
        endpoint_public_access    = true
        public_access_cidrs       = [
            "0.0.0.0/0",
        ]
        security_group_ids        = [
            "sg-00bea0f7b97faf915",
        ]
        subnet_ids                = [
            "subnet-00c5740a767a96283",
            "subnet-04b3d9a45b92d785e",
            "subnet-080fdd6d114ac0006",
        ]
        vpc_id                    = "vpc-081d24a4ddacd1ee4"
    }
}

# module.eks-cluster.aws_iam_instance_profile.workers[0]:
resource "aws_iam_instance_profile" "workers" {
    arn         = "arn:aws:iam::801983320073:instance-profile/staging20210806090447805800000002"
    create_date = "2021-08-06T09:04:48Z"
    id          = "staging20210806090447805800000002"
    name        = "staging20210806090447805800000002"
    name_prefix = "staging"
    path        = "/"
    role        = "staging20210806090444896600000001"
    tags        = {}
    tags_all    = {}
    unique_id   = "AIPA3VOPOKAESNQPIW47C"
}

# module.eks-cluster.aws_iam_policy.cluster_elb_sl_role_creation[0]:
resource "aws_iam_policy" "cluster_elb_sl_role_creation" {
    arn         = "arn:aws:iam::801983320073:policy/staging-elb-sl-role-creation20210806085255749300000001"
    description = "Permissions for EKS to create AWSServiceRoleForElasticLoadBalancing service-linked role"
    id          = "arn:aws:iam::801983320073:policy/staging-elb-sl-role-creation20210806085255749300000001"
    name        = "staging-elb-sl-role-creation20210806085255749300000001"
    name_prefix = "staging-elb-sl-role-creation"
    path        = "/"
    policy      = jsonencode(
        {
            Statement = [
                {
                    Action   = [
                        "ec2:DescribeInternetGateways",
                        "ec2:DescribeAddresses",
                        "ec2:DescribeAccountAttributes",
                    ]
                    Effect   = "Allow"
                    Resource = "*"
                    Sid      = ""
                },
            ]
            Version   = "2012-10-17"
        }
    )
    policy_id   = "ANPA3VOPOKAE4I6JM5ASZ"
    tags        = {}
    tags_all    = {}
}

# module.eks-cluster.aws_iam_role.cluster[0]:
resource "aws_iam_role" "cluster" {
    arn                   = "arn:aws:iam::801983320073:role/staging20210806085255755900000002"
    assume_role_policy    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        Service = "eks.amazonaws.com"
                    }
                    Sid       = "EKSClusterAssumeRole"
                },
            ]
            Version   = "2012-10-17"
        }
    )
    create_date           = "2021-08-06T08:52:56Z"
    force_detach_policies = true
    id                    = "staging20210806085255755900000002"
    managed_policy_arns   = [
        "arn:aws:iam::801983320073:policy/staging-elb-sl-role-creation20210806085255749300000001",
        "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
        "arn:aws:iam::aws:policy/AmazonEKSServicePolicy",
        "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController",
    ]
    max_session_duration  = 3600
    name                  = "staging20210806085255755900000002"
    name_prefix           = "staging"
    path                  = "/"
    tags                  = {}
    tags_all              = {}
    unique_id             = "AROA3VOPOKAETEIEIEKQX"

    inline_policy {}
}

# module.eks-cluster.aws_iam_role.workers[0]:
resource "aws_iam_role" "workers" {
    arn                   = "arn:aws:iam::801983320073:role/staging20210806090444896600000001"
    assume_role_policy    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        Service = "ec2.amazonaws.com"
                    }
                    Sid       = "EKSWorkerAssumeRole"
                },
            ]
            Version   = "2012-10-17"
        }
    )
    create_date           = "2021-08-06T09:04:45Z"
    force_detach_policies = true
    id                    = "staging20210806090444896600000001"
    managed_policy_arns   = [
        "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
        "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
        "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    ]
    max_session_duration  = 3600
    name                  = "staging20210806090444896600000001"
    name_prefix           = "staging"
    path                  = "/"
    tags                  = {}
    tags_all              = {}
    unique_id             = "AROA3VOPOKAE75B4E3JOX"

    inline_policy {}
}

# module.eks-cluster.aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy[0]:
resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
    id         = "staging20210806085255755900000002-20210806085259103700000005"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role       = "staging20210806085255755900000002"
}

# module.eks-cluster.aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy[0]:
resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSServicePolicy" {
    id         = "staging20210806085255755900000002-20210806085259116200000006"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
    role       = "staging20210806085255755900000002"
}

# module.eks-cluster.aws_iam_role_policy_attachment.cluster_AmazonEKSVPCResourceControllerPolicy[0]:
resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSVPCResourceControllerPolicy" {
    id         = "staging20210806085255755900000002-20210806085259079500000003"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
    role       = "staging20210806085255755900000002"
}

# module.eks-cluster.aws_iam_role_policy_attachment.cluster_elb_sl_role_creation[0]:
resource "aws_iam_role_policy_attachment" "cluster_elb_sl_role_creation" {
    id         = "staging20210806085255755900000002-20210806085259092300000004"
    policy_arn = "arn:aws:iam::801983320073:policy/staging-elb-sl-role-creation20210806085255749300000001"
    role       = "staging20210806085255755900000002"
}

# module.eks-cluster.aws_iam_role_policy_attachment.workers_AmazonEC2ContainerRegistryReadOnly[0]:
resource "aws_iam_role_policy_attachment" "workers_AmazonEC2ContainerRegistryReadOnly" {
    id         = "staging20210806090444896600000001-20210806090449688900000005"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role       = "staging20210806090444896600000001"
}

# module.eks-cluster.aws_iam_role_policy_attachment.workers_AmazonEKSWorkerNodePolicy[0]:
resource "aws_iam_role_policy_attachment" "workers_AmazonEKSWorkerNodePolicy" {
    id         = "staging20210806090444896600000001-20210806090449639400000003"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role       = "staging20210806090444896600000001"
}

# module.eks-cluster.aws_iam_role_policy_attachment.workers_AmazonEKS_CNI_Policy[0]:
resource "aws_iam_role_policy_attachment" "workers_AmazonEKS_CNI_Policy" {
    id         = "staging20210806090444896600000001-20210806090449644200000004"
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role       = "staging20210806090444896600000001"
}

# module.eks-cluster.aws_launch_configuration.workers[0]:
resource "aws_launch_configuration" "workers" {
    arn                         = "arn:aws:autoscaling:eu-central-1:801983320073:launchConfiguration:bd5da321-b3a6-4697-be5a-2af66a27d397:launchConfigurationName/staging-020210806095925682500000001"
    associate_public_ip_address = false
    ebs_optimized               = true
    enable_monitoring           = true
    iam_instance_profile        = "staging20210806090447805800000002"
    id                          = "staging-020210806095925682500000001"
    image_id                    = "ami-08144c56c0452df2e"
    instance_type               = "t3.medium"
    name                        = "staging-020210806095925682500000001"
    name_prefix                 = "staging-0"
    security_groups             = [
        "sg-09d968af2abe62c77",
    ]
    user_data_base64            = "IyEvYmluL2Jhc2ggLWUKCiMgQWxsb3cgdXNlciBzdXBwbGllZCBwcmUgdXNlcmRhdGEgY29kZQoKCiMgQm9vdHN0cmFwIGFuZCBqb2luIHRoZSBjbHVzdGVyCi9ldGMvZWtzL2Jvb3RzdHJhcC5zaCAtLWI2NC1jbHVzdGVyLWNhICdMUzB0TFMxQ1JVZEpUaUJEUlZKVVNVWkpRMEZVUlMwdExTMHRDazFKU1VNMWVrTkRRV01yWjBGM1NVSkJaMGxDUVVSQlRrSm5hM0ZvYTJsSE9YY3dRa0ZSYzBaQlJFRldUVkpOZDBWUldVUldVVkZFUlhkd2NtUlhTbXdLWTIwMWJHUkhWbnBOUWpSWVJGUkplRTFFWjNkT2FrRTFUVVJCTUUxc2IxaEVWRTE0VFVSbmQwNUVRVFZOUkVFd1RXeHZkMFpVUlZSTlFrVkhRVEZWUlFwQmVFMUxZVE5XYVZwWVNuVmFXRkpzWTNwRFEwRlRTWGRFVVZsS1MyOWFTV2gyWTA1QlVVVkNRbEZCUkdkblJWQkJSRU5EUVZGdlEyZG5SVUpCVDJWMkNsQkxhamR0UzJVeWVGazRUVlV5ZFZjd1QyNUdNMHRSZFRaMWFrcFhlRFkyUTNreGNrbEdNRlpRUkhrdlMyaFFjVWx2TnpWck1uZDRSMXB5VGk5MFIyY0tkVkJPZFVOaWNFRndWMFlyTnpSc1VqaEtPVmxsZWpJMUszWTJUbGszVjBneU56UTFWelkyZVRjclNUZGpUM1JLZUhaVVkzazJSalJHY3pReGJrTTVlQXBQTDNGVWRXWlhTV2hTVW1oWFVFdGtRV1pyV1hkVk5URnJUWEU0TVhKU1kwSkVOblV6YmpJdlkyeDNhVll3YWt0QllVOUVSVUpUWjA5aGNXZFhkRTVFQ2tKT01WTnlNRXg0YWtaNVNYUldRVk5aZDFKaVFtMXJORmxNVmsxVlVuY3lha0ZHUW13MmFXbERPVmxUYTB4dFlYRnRZWGwzVnpselRrMUhaRVZrYzNBS1dYa3hhMmhNV2pNNWNIRlNSVkk0YzJFdkszQlhZWGhrVW5obWIwRlFWVEYwVGtSSU5VRXZVMjFDVkhOWU1qRXhUMlZtVkhsNFZWWXlUekpWTUc5SVFncG5iRUZzVmtFMWVWUTFWRkpHYlRaaFJ6aHpRMEYzUlVGQllVNURUVVZCZDBSbldVUldVakJRUVZGSUwwSkJVVVJCWjB0clRVRTRSMEV4VldSRmQwVkNDaTkzVVVaTlFVMUNRV1k0ZDBoUldVUldVakJQUWtKWlJVWk9SbEpCVkhSRk1WcEhLMk0wYTNSalJscFVVWE5qVTFsNVZsRk5RVEJIUTFOeFIxTkpZak1LUkZGRlFrTjNWVUZCTkVsQ1FWRkJXRkY1YlM5a1ZsZEdkelpLTDFFMGIzUnhSM0JqVTB4MkwyNUplV1phVERreFRYRm9kRmxFVGxscFYxTXlaMFIzWVFwdU5UYzNRMDl2U0M4NEswaGpUREJRVW5SR1pIazRibFZ6WjNoU2EwMXJlazVSY3pWUVZVaG1ha2xJTjJwVVJuTjVSRXA1T0hCTVZHZzRSUzlIWjBsT0NpOUVVVXhwZEdsa1EzaDJabVkyYlRJM2RFRm9SMDFaU1RoRU1IbzBTM04wTDNReFQwSlNiV0UzUjNWSVYxbFpOVXd6ZHpCdVZrTnJUbGhQZUdoUlJtRUtOa3hYY1ZocWNHa3dRMEZtSzBoR01rWjVjelZtUkhwdGFVUmlXR2wzWWpFcmRXeHhhRlJFTm14M2VGcFJRV2QyYUZKUVFVRnJlbWxLTTAweWRDdElOQXA0UTJWaU0wbHRUbWh4YVZCNk9EZzBaR2hUVkdRelEwcHdkbU16VEhkWldsazJNazVxUlVGak9EYzFlVkl5S3pGUWFVbG1hVEoxY21Od2EzSTVkRmRVQ25WV1owMUNRVTB4TUdGWGEyaEdjVXBWT1dsaFNHWmxjWE5pV25RMGNVTm5TRzVPUVFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PScgLS1hcGlzZXJ2ZXItZW5kcG9pbnQgJ2h0dHBzOi8vMUZCRjgxRTlEMDk1Q0IxNEI0N0RCRDJFODg3OTNFRUIuZ3I3LmV1LWNlbnRyYWwtMS5la3MuYW1hem9uYXdzLmNvbScgIC0ta3ViZWxldC1leHRyYS1hcmdzICIiICdzdGFnaW5nJwoKIyBBbGxvdyB1c2VyIHN1cHBsaWVkIHVzZXJkYXRhIGNvZGUKCg=="

    metadata_options {
        http_endpoint               = "enabled"
        http_put_response_hop_limit = 1
        http_tokens                 = "optional"
    }

    root_block_device {
        delete_on_termination = true
        encrypted             = false
        iops                  = 0
        throughput            = 0
        volume_size           = 100
        volume_type           = "gp2"
    }
}

# module.eks-cluster.aws_security_group.cluster[0]:
resource "aws_security_group" "cluster" {
    arn                    = "arn:aws:ec2:eu-central-1:801983320073:security-group/sg-00bea0f7b97faf915"
    description            = "EKS cluster security group."
    egress                 = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "Allow cluster egress access to the Internet."
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    id                     = "sg-00bea0f7b97faf915"
    ingress                = [
        {
            cidr_blocks      = []
            description      = "Allow pods to communicate with the EKS cluster API."
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-09d968af2abe62c77",
            ]
            self             = false
            to_port          = 443
        },
    ]
    name                   = "staging20210806085310054600000007"
    name_prefix            = "staging"
    owner_id               = "801983320073"
    revoke_rules_on_delete = false
    tags                   = {
        "Name" = "staging-eks_cluster_sg"
    }
    tags_all               = {
        "Name" = "staging-eks_cluster_sg"
    }
    vpc_id                 = "vpc-081d24a4ddacd1ee4"
}

# module.eks-cluster.aws_security_group.workers[0]:
resource "aws_security_group" "workers" {
    arn                    = "arn:aws:ec2:eu-central-1:801983320073:security-group/sg-09d968af2abe62c77"
    description            = "Security group for all nodes in the cluster."
    egress                 = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = "Allow nodes all egress to the Internet."
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    id                     = "sg-09d968af2abe62c77"
    ingress                = [
        {
            cidr_blocks      = []
            description      = "Allow node to communicate with each other."
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = true
            to_port          = 0
        },
        {
            cidr_blocks      = []
            description      = "Allow pods running extension API servers on port 443 to receive communication from cluster control plane."
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-00bea0f7b97faf915",
            ]
            self             = false
            to_port          = 443
        },
        {
            cidr_blocks      = []
            description      = "Allow workers pods to receive communication from the cluster control plane."
            from_port        = 1025
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = [
                "sg-00bea0f7b97faf915",
            ]
            self             = false
            to_port          = 65535
        },
    ]
    name                   = "staging20210806085310055300000008"
    name_prefix            = "staging"
    owner_id               = "801983320073"
    revoke_rules_on_delete = false
    tags                   = {
        "Name"                          = "staging-eks_worker_sg"
        "kubernetes.io/cluster/staging" = "owned"
    }
    tags_all               = {
        "Name"                          = "staging-eks_worker_sg"
        "kubernetes.io/cluster/staging" = "owned"
    }
    vpc_id                 = "vpc-081d24a4ddacd1ee4"
}

# module.eks-cluster.aws_security_group_rule.cluster_egress_internet[0]:
resource "aws_security_group_rule" "cluster_egress_internet" {
    cidr_blocks       = [
        "0.0.0.0/0",
    ]
    description       = "Allow cluster egress access to the Internet."
    from_port         = 0
    id                = "sgrule-651759018"
    ipv6_cidr_blocks  = []
    prefix_list_ids   = []
    protocol          = "-1"
    security_group_id = "sg-00bea0f7b97faf915"
    self              = false
    to_port           = 0
    type              = "egress"
}

# module.eks-cluster.aws_security_group_rule.cluster_https_worker_ingress[0]:
resource "aws_security_group_rule" "cluster_https_worker_ingress" {
    cidr_blocks              = []
    description              = "Allow pods to communicate with the EKS cluster API."
    from_port                = 443
    id                       = "sgrule-4022426407"
    ipv6_cidr_blocks         = []
    prefix_list_ids          = []
    protocol                 = "tcp"
    security_group_id        = "sg-00bea0f7b97faf915"
    self                     = false
    source_security_group_id = "sg-09d968af2abe62c77"
    to_port                  = 443
    type                     = "ingress"
}

# module.eks-cluster.aws_security_group_rule.workers_egress_internet[0]:
resource "aws_security_group_rule" "workers_egress_internet" {
    cidr_blocks       = [
        "0.0.0.0/0",
    ]
    description       = "Allow nodes all egress to the Internet."
    from_port         = 0
    id                = "sgrule-3865810567"
    ipv6_cidr_blocks  = []
    prefix_list_ids   = []
    protocol          = "-1"
    security_group_id = "sg-09d968af2abe62c77"
    self              = false
    to_port           = 0
    type              = "egress"
}

# module.eks-cluster.aws_security_group_rule.workers_ingress_cluster[0]:
resource "aws_security_group_rule" "workers_ingress_cluster" {
    cidr_blocks              = []
    description              = "Allow workers pods to receive communication from the cluster control plane."
    from_port                = 1025
    id                       = "sgrule-3070142275"
    ipv6_cidr_blocks         = []
    prefix_list_ids          = []
    protocol                 = "tcp"
    security_group_id        = "sg-09d968af2abe62c77"
    self                     = false
    source_security_group_id = "sg-00bea0f7b97faf915"
    to_port                  = 65535
    type                     = "ingress"
}

# module.eks-cluster.aws_security_group_rule.workers_ingress_cluster_https[0]:
resource "aws_security_group_rule" "workers_ingress_cluster_https" {
    cidr_blocks              = []
    description              = "Allow pods running extension API servers on port 443 to receive communication from cluster control plane."
    from_port                = 443
    id                       = "sgrule-3003477286"
    ipv6_cidr_blocks         = []
    prefix_list_ids          = []
    protocol                 = "tcp"
    security_group_id        = "sg-09d968af2abe62c77"
    self                     = false
    source_security_group_id = "sg-00bea0f7b97faf915"
    to_port                  = 443
    type                     = "ingress"
}

# module.eks-cluster.aws_security_group_rule.workers_ingress_self[0]:
resource "aws_security_group_rule" "workers_ingress_self" {
    cidr_blocks              = []
    description              = "Allow node to communicate with each other."
    from_port                = 0
    id                       = "sgrule-371546327"
    ipv6_cidr_blocks         = []
    prefix_list_ids          = []
    protocol                 = "-1"
    security_group_id        = "sg-09d968af2abe62c77"
    self                     = false
    source_security_group_id = "sg-09d968af2abe62c77"
    to_port                  = 0
    type                     = "ingress"
}

# module.eks-cluster.data.aws_ami.eks_worker[0]:
data "aws_ami" "eks_worker" {
    architecture          = "x86_64"
    arn                   = "arn:aws:ec2:eu-central-1::image/ami-08144c56c0452df2e"
    block_device_mappings = [
        {
            device_name  = "/dev/xvda"
            ebs          = {
                "delete_on_termination" = "true"
                "encrypted"             = "false"
                "iops"                  = "0"
                "snapshot_id"           = "snap-0a7ab96678e4ab142"
                "throughput"            = "0"
                "volume_size"           = "20"
                "volume_type"           = "gp2"
            }
            no_device    = ""
            virtual_name = ""
        },
    ]
    creation_date         = "2021-07-22T21:27:23.000Z"
    description           = "EKS Kubernetes Worker AMI with AmazonLinux2 image, (k8s: 1.20.4, docker: 19.03.13ce-1.amzn2, containerd: 1.4.6-2.amzn2)"
    ena_support           = true
    hypervisor            = "xen"
    id                    = "ami-08144c56c0452df2e"
    image_id              = "ami-08144c56c0452df2e"
    image_location        = "amazon/amazon-eks-node-1.20-v20210722"
    image_owner_alias     = "amazon"
    image_type            = "machine"
    most_recent           = true
    name                  = "amazon-eks-node-1.20-v20210722"
    owner_id              = "602401143452"
    owners                = [
        "amazon",
    ]
    platform_details      = "Linux/UNIX"
    product_codes         = []
    public                = true
    root_device_name      = "/dev/xvda"
    root_device_type      = "ebs"
    root_snapshot_id      = "snap-0a7ab96678e4ab142"
    sriov_net_support     = "simple"
    state                 = "available"
    state_reason          = {
        "code"    = "UNSET"
        "message" = "UNSET"
    }
    tags                  = {}
    usage_operation       = "RunInstances"
    virtualization_type   = "hvm"

    filter {
        name   = "name"
        values = [
            "amazon-eks-node-1.20-v*",
        ]
    }
}

# module.eks-cluster.data.aws_caller_identity.current:
data "aws_caller_identity" "current" {
    account_id = "801983320073"
    arn        = "arn:aws:iam::801983320073:user/admin"
    id         = "801983320073"
    user_id    = "AIDA3VOPOKAEX37TLEVVM"
}

# module.eks-cluster.data.aws_iam_policy_document.cluster_assume_role_policy:
data "aws_iam_policy_document" "cluster_assume_role_policy" {
    id      = "2764486067"
    json    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        Service = "eks.amazonaws.com"
                    }
                    Sid       = "EKSClusterAssumeRole"
                },
            ]
            Version   = "2012-10-17"
        }
    )
    version = "2012-10-17"

    statement {
        actions       = [
            "sts:AssumeRole",
        ]
        effect        = "Allow"
        not_actions   = []
        not_resources = []
        resources     = []
        sid           = "EKSClusterAssumeRole"

        principals {
            identifiers = [
                "eks.amazonaws.com",
            ]
            type        = "Service"
        }
    }
}

# module.eks-cluster.data.aws_iam_policy_document.cluster_elb_sl_role_creation[0]:
data "aws_iam_policy_document" "cluster_elb_sl_role_creation" {
    id      = "3709839417"
    json    = jsonencode(
        {
            Statement = [
                {
                    Action   = [
                        "ec2:DescribeInternetGateways",
                        "ec2:DescribeAddresses",
                        "ec2:DescribeAccountAttributes",
                    ]
                    Effect   = "Allow"
                    Resource = "*"
                    Sid      = ""
                },
            ]
            Version   = "2012-10-17"
        }
    )
    version = "2012-10-17"

    statement {
        actions       = [
            "ec2:DescribeAccountAttributes",
            "ec2:DescribeAddresses",
            "ec2:DescribeInternetGateways",
        ]
        effect        = "Allow"
        not_actions   = []
        not_resources = []
        resources     = [
            "*",
        ]
    }
}

# module.eks-cluster.data.aws_iam_policy_document.workers_assume_role_policy:
data "aws_iam_policy_document" "workers_assume_role_policy" {
    id      = "3778018924"
    json    = jsonencode(
        {
            Statement = [
                {
                    Action    = "sts:AssumeRole"
                    Effect    = "Allow"
                    Principal = {
                        Service = "ec2.amazonaws.com"
                    }
                    Sid       = "EKSWorkerAssumeRole"
                },
            ]
            Version   = "2012-10-17"
        }
    )
    version = "2012-10-17"

    statement {
        actions       = [
            "sts:AssumeRole",
        ]
        effect        = "Allow"
        not_actions   = []
        not_resources = []
        resources     = []
        sid           = "EKSWorkerAssumeRole"

        principals {
            identifiers = [
                "ec2.amazonaws.com",
            ]
            type        = "Service"
        }
    }
}

# module.eks-cluster.data.aws_partition.current:
data "aws_partition" "current" {
    dns_suffix         = "amazonaws.com"
    id                 = "aws"
    partition          = "aws"
    reverse_dns_prefix = "com.amazonaws"
}

# module.eks-cluster.data.http.wait_for_cluster[0]:
data "http" "wait_for_cluster" {
    body             = "ok"
    ca_certificate   = <<-EOT
        -----BEGIN CERTIFICATE-----
        MIIC5zCCAc+gAwIBAgIBADANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwprdWJl
        cm5ldGVzMB4XDTIxMDgwNjA5MDA0MloXDTMxMDgwNDA5MDA0MlowFTETMBEGA1UE
        AxMKa3ViZXJuZXRlczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOev
        PKj7mKe2xY8MU2uW0OnF3KQu6ujJWx66Cy1rIF0VPDy/KhPqIo75k2wxGZrN/tGg
        uPNuCbpApWF+74lR8J9Yez25+v6NY7WH2745W66y7+I7cOtJxvTcy6F4Fs41nC9x
        O/qTufWIhRRhWPKdAfkYwU51kMq81rRcBD6u3n2/clwiV0jKAaODEBSgOaqgWtND
        BN1Sr0LxjFyItVASYwRbBmk4YLVMURw2jAFBl6iiC9YSkLmaqmaywW9sNMGdEdsp
        Yy1khLZ39pqRER8sa/+pWaxdRxfoAPU1tNDH5A/SmBTsX211OefTyxUV2O2U0oHB
        glAlVA5yT5TRFm6aG8sCAwEAAaNCMEAwDgYDVR0PAQH/BAQDAgKkMA8GA1UdEwEB
        /wQFMAMBAf8wHQYDVR0OBBYEFNFRATtE1ZG+c4ktcFZTQscSYyVQMA0GCSqGSIb3
        DQEBCwUAA4IBAQAXQym/dVWFw6J/Q4otqGpcSLv/nIyfZL91MqhtYDNYiWS2gDwa
        n577COoH/8+HcL0PRtFdy8nUsgxRkMkzNQs5PUHfjIH7jTFsyDJy8pLTh8E/GgIN
        /DQLitidCxvff6m27tAhGMYI8D0z4Kst/t1OBRma7GuHWYY5L3w0nVCkNXOxhQFa
        6LWqXjpi0CAf+HF2Fys5fDzmiDbXiwb1+ulqhTD6lwxZQAgvhRPAAkziJ3M2t+H4
        xCeb3ImNhqiPz884dhSTd3CJpvc3LwYZY62NjEAc875yR2+1PiIfi2urcpkr9tWT
        uVgMBAM10aWkhFqJU9iaHfeqsbZt4qCgHnNA
        -----END CERTIFICATE-----
    EOT
    id               = "https://1FBF81E9D095CB14B47DBD2E88793EEB.gr7.eu-central-1.eks.amazonaws.com/healthz"
    insecure         = false
    response_headers = {
        "Cache-Control"                     = "no-cache, private"
        "Content-Length"                    = "2"
        "Content-Type"                      = "text/plain; charset=utf-8"
        "Date"                              = "Fri, 06 Aug 2021 09:59:15 GMT"
        "X-Content-Type-Options"            = "nosniff"
        "X-Kubernetes-Pf-Flowschema-Uid"    = "57b0bc25-1938-4400-8683-70f75aee6a54"
        "X-Kubernetes-Pf-Prioritylevel-Uid" = "b14e970f-c92c-411a-b976-8f20c613f26e"
    }
    timeout          = 300
    url              = "https://1FBF81E9D095CB14B47DBD2E88793EEB.gr7.eu-central-1.eks.amazonaws.com/healthz"
}

# module.eks-cluster.kubernetes_config_map.aws_auth[0]:
resource "kubernetes_config_map" "aws_auth" {
    binary_data = {}
    data        = {
        "mapAccounts" = jsonencode([])
        "mapRoles"    = <<-EOT
            - "groups":
              - "system:bootstrappers"
              - "system:nodes"
              "rolearn": "arn:aws:iam::801983320073:role/staging20210806090444896600000001"
              "username": "system:node:{{EC2PrivateDNSName}}"
        EOT
        "mapUsers"    = jsonencode([])
    }
    id          = "kube-system/aws-auth"

    metadata {
        annotations      = {}
        generation       = 0
        labels           = {
            "app.kubernetes.io/managed-by" = "Terraform"
            "terraform.io/module"          = "terraform-aws-modules.eks.aws"
        }
        name             = "aws-auth"
        namespace        = "kube-system"
        resource_version = "636"
        uid              = "ae24df32-5a84-41f4-a16f-dd027139d883"
    }
}

# module.eks-cluster.local_file.kubeconfig[0]:
resource "local_file" "kubeconfig" {
    content              = <<-EOT
        apiVersion: v1
        preferences: {}
        kind: Config
        
        clusters:
        - cluster:
            server: https://1FBF81E9D095CB14B47DBD2E88793EEB.gr7.eu-central-1.eks.amazonaws.com
            certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUM1ekNDQWMrZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeE1EZ3dOakE1TURBME1sb1hEVE14TURnd05EQTVNREEwTWxvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBT2V2ClBLajdtS2UyeFk4TVUydVcwT25GM0tRdTZ1akpXeDY2Q3kxcklGMFZQRHkvS2hQcUlvNzVrMnd4R1pyTi90R2cKdVBOdUNicEFwV0YrNzRsUjhKOVllejI1K3Y2Tlk3V0gyNzQ1VzY2eTcrSTdjT3RKeHZUY3k2RjRGczQxbkM5eApPL3FUdWZXSWhSUmhXUEtkQWZrWXdVNTFrTXE4MXJSY0JENnUzbjIvY2x3aVYwaktBYU9ERUJTZ09hcWdXdE5ECkJOMVNyMEx4akZ5SXRWQVNZd1JiQm1rNFlMVk1VUncyakFGQmw2aWlDOVlTa0xtYXFtYXl3VzlzTk1HZEVkc3AKWXkxa2hMWjM5cHFSRVI4c2EvK3BXYXhkUnhmb0FQVTF0TkRINUEvU21CVHNYMjExT2VmVHl4VVYyTzJVMG9IQgpnbEFsVkE1eVQ1VFJGbTZhRzhzQ0F3RUFBYU5DTUVBd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZORlJBVHRFMVpHK2M0a3RjRlpUUXNjU1l5VlFNQTBHQ1NxR1NJYjMKRFFFQkN3VUFBNElCQVFBWFF5bS9kVldGdzZKL1E0b3RxR3BjU0x2L25JeWZaTDkxTXFodFlETllpV1MyZ0R3YQpuNTc3Q09vSC84K0hjTDBQUnRGZHk4blVzZ3hSa01rek5RczVQVUhmaklIN2pURnN5REp5OHBMVGg4RS9HZ0lOCi9EUUxpdGlkQ3h2ZmY2bTI3dEFoR01ZSThEMHo0S3N0L3QxT0JSbWE3R3VIV1lZNUwzdzBuVkNrTlhPeGhRRmEKNkxXcVhqcGkwQ0FmK0hGMkZ5czVmRHptaURiWGl3YjErdWxxaFRENmx3eFpRQWd2aFJQQUFremlKM00ydCtINAp4Q2ViM0ltTmhxaVB6ODg0ZGhTVGQzQ0pwdmMzTHdZWlk2Mk5qRUFjODc1eVIyKzFQaUlmaTJ1cmNwa3I5dFdUCnVWZ01CQU0xMGFXa2hGcUpVOWlhSGZlcXNiWnQ0cUNnSG5OQQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
          name: eks_staging
        
        contexts:
        - context:
            cluster: eks_staging
            user: eks_staging
          name: eks_staging
        
        current-context: eks_staging
        
        users:
        - name: eks_staging
          user:
            exec:
              apiVersion: client.authentication.k8s.io/v1alpha1
              command: aws-iam-authenticator
              args:
                - "token"
                - "-i"
                - "staging"
    EOT
    directory_permission = "0755"
    file_permission      = "0600"
    filename             = "./kubeconfig_staging"
    id                   = "263837d6ac40ac29742c3c014d070949027ebdca"
}
