# AWS EKS

Cluster IAM Role ARN
arn:aws:iam::801983320073:role/staging20210806085255755900000002

Cluster ARN
arn:aws:eks:eu-central-1:801983320073:cluster/staging

## Installing aws-iam-authenticator

``` bash
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
mv aws-iam-authenticator /usr/local/bin/
```
