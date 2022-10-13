# resource "aws_cloudwatch_log_group" "eks_logs" {
#   # The log group name format is /aws/eks/<cluster-name>/cluster
#   # Reference: https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html
#   name              = "/aws/eks/${local.cluster_name}-cluster/cluster"
#   retention_in_days = 7

#   # ... potentially other configuration ...
# }
