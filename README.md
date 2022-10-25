
## получение кубконфига
```
aws eks list-clusters --profile tv-akiyanov --region us-east-1
```

```
$ aws eks update-kubeconfig --profile tv-akiyanov --region us-east-1 --name eks-v2 --kubeconfig ~/.kube/eks-v2
```
export KUBECONFIG=/home/akudryashov/.kube/eks-v2


## LB
https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.4/
https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.4/guide/service/nlb/

https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html
https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html

helm repo add eks https://aws.github.io/eks-charts
helm repo update


helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=eks-v2 \
  --set region=us-east-1 \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller






<!-- kubectl annotate serviceaccount -n kube-system aws-load-balancer-controller \ eks.amazonaws.com/role-arn=arn:aws:iam::691889635880:role/arn:aws:iam::691889635880:role/aws-service-role/elasticloadbalancing.amazonaws.com/AWSServiceRoleForElasticLoadBalancing

kubectl annotate serviceaccount -n <SERVICE_ACCOUNT_NAMESPACE> <SERVICE_ACCOUNT_NAME> \ eks.amazonaws.com/role-arn=arn:aws:iam::<ACCOUNT_ID>:role/<IAM_ROLE_NAME> -->



Для создания ресурсов типа `resource "kubernetes_service_account"` через терраформ на машине с которой происходит прокатка должен быть настроен доступ к кластеру через kubectl!
