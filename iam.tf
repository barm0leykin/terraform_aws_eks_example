resource "aws_iam_policy" "eks-ebs-sci-driver" {
  description = "Amazon_EBS_CSI_Driver"
  name        = "eks-ebs-sci-driver"
  path        = "/"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:AttachVolume",
        "ec2:CreateSnapshot",
        "ec2:CreateTags",
        "ec2:CreateVolume",
        "ec2:DeleteSnapshot",
        "ec2:DeleteTags",
        "ec2:DeleteVolume",
        "ec2:DescribeInstances",
        "ec2:DescribeSnapshots",
        "ec2:DescribeTags",
        "ec2:DescribeVolumes",
        "ec2:DetachVolume",
        "ec2:ModifyVolume",
        "ec2:DescribeVolumesModifications",
        "ec2:VolumeModification"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}
