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

## assume role - если нужно
aws sts assume-role --profile tv --role-arn arn:aws:iam::111111111111:role/akudryashov --role-session-name akudryashov

MFA
aws sts assume-role --profile tv --role-arn arn:aws:iam::111111111111:role/akudryashov --role-session-name akudryashov --region eu-west-2 --serial-number arn:aws:iam::114933429123:mfa/akudryashov --token-code 416760

Assume и запись значений в переменные окружения
eval $(aws sts assume-role --profile tv --role-arn arn:aws:iam::111111111111:role/akudryashov --role-session-name akudryashov --region eu-west-2 --serial-number arn:aws:iam::114933429123:mfa/akudryashov --token-code 41676 | jq -r '.Credentials | "export AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey)\nexport AWS_SESSION_TOKEN=\(.SessionToken)\n"')

MFA=1111
ARN=arn:aws:iam::1111111111111111:role/akudryashov
eval $(aws sts assume-role --profile tv-akiyanov --role-arn $ARN --role-session-name akudryashov --region eu-west-2 --serial-number arn:aws:iam::114933429123:mfa/akudryashov --token-code $MFA | jq -r '.Credentials | "export AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey)\nexport AWS_SESSION_TOKEN=\(.SessionToken)\n"')

Можно подправить файл
> ~/.aws/credentials
```
[tv]
aws_access_key_id = ...
aws_secret_access_key = ...
region = us-east-1

[tv-staging]
role_arn = arn:aws:iam::111111111111:role/akudryashov
mfa_serial = arn:aws:iam::111111111111:mfa/akudryashov
source_profile = tv
```
и использовать потом так `aws ... --profile tv-staging`

## получение кубконфига
```
aws eks list-clusters --profile tv-akiyanov --region us-east-1
```

```
$ aws eks update-kubeconfig --profile tv-akiyanov --region us-east-1 --name eks-v2 --kubeconfig ~/.kube/eks-v2

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


AWS_PROFILE=default
AWS_REGION=us-east-1
SESSION_NAME=akudryashov
ARN=arn:aws:iam::691889635880:role/akudryashov
SERIAL_NUMBER=arn:aws:iam::114933429123:mfa/akudryashov

AWS_PROFILE=tv-staging
REGION=us-east-1
SESSION_NAME=akudryashov
ARN=arn:aws:iam::873489506556:role/akudryashov
SERIAL_NUMBER=arn:aws:iam::114933429123:mfa/akudryashov

MFA=1111

eval $(aws sts assume-role --profile $AWS_PROFILE --role-arn $ARN --role-session-name $SESSION_NAME --region $AWS_REGION --serial-number $SERIAL_NUMBER --token-code $MFA | jq -r '.Credentials | "export AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey)\nexport AWS_SESSION_TOKEN=\(.SessionToken)\n"')

eval $(aws sts assume-role --profile $AWS_PROFILE --role-arn $ARN --role-session-name $SESSION_NAME --region $AWS_REGION  | jq -r '.Credentials | "export AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey)\nexport AWS_SESSION_TOKEN=\(.SessionToken)\n"')

aws eks list-clusters --profile tv-akiyanov --region us-east-1



old
aws sts assume-role --profile tv --role-arn arn:aws:iam::873489506556:role/akudryashov --role-session-name akudryashov --region eu-west-2 --serial-number arn:aws:iam::114933429123:mfa/akudryashov --token-code 416760
