resource "aws_security_group" "worker_group_1" {
  name_prefix = "eks-worker_group_1"
  vpc_id      = aws_vpc.eks-staging.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
}
