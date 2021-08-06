
// resource "aws_iam_role" "eks_cluster" {
//   name = "eks-cluster"

//   assume_role_policy = <<POLICY
// {
//   "Version": "2012-10-17",
//   "Statement": [
//     {
//       "Effect": "Allow",
//       "Principal": {
//         "Service": "eks.amazonaws.com"
//       },
//       "Action": "sts:AssumeRole"
//     }
//   ]
// }
// POLICY
// }

// resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
//   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
//   role       = aws_iam_role.eks_cluster.name
// }

// resource "aws_iam_role_policy_attachment" "AmazonEKSServicePolicy" {
//   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
//   role       = aws_iam_role.eks_cluster.name
// }

// resource "aws_eks_cluster" "aws_eks" {
//   name     = "eks_cluster_tuto"
//   role_arn = aws_iam_role.eks_cluster.arn

//   vpc_config {
//     subnet_ids = ["subnet-4d0d3324", "subnet-b3a8f9c8"]
//   }

//   tags = {
//     Name = "EKS_tuto"
//   }
// }

resource "aws_iam_user_policy" "policy-eks-cluster-staging" {
  name = "policy-eks-cluster-staging"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.tradingview-jira-backup-staging.arn}/*"
      ],
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  user = aws_iam_user.robot-s3-jira-backup-staging.name
}
