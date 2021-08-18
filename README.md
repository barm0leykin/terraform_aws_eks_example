# AWS EKS

Cluster IAM Role ARN
arn:aws:iam::801983320073:role/staging20210806085255755900000002

Cluster ARN
arn:aws:eks:eu-central-1:801983320073:cluster/staging

## Installing aws-iam-authenticator

``` bash
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/local/bin/
```

## получение кубконфига
```
$ aws eks update-kubeconfig --profile default --region eu-central-1 --name staging
Added new context arn:aws:eks:eu-central-1:801983320073:cluster/staging to /home/akudryashov/.kube/config

```
## получение токена
```
aws eks get-token --profile default --region eu-central-1 --cluster-name staging
```

### Добавляем алиас для удобства
```
echo "alias kk=\"kubectl\"" >> ~/.bashrc
```
