# Создание EKS кластера вручную


## IAM Role

Создаём роль EKS - EKS - Cluster 
 На выходе получаем роль:
 k8s-staging-iam-role
 

## VPC
Создаём VPC

## Security Groups
SG уже создана, переименуем её в eks-staging-sg
+ добавим правила для tcp:22


## Internet Gateway
eks-staging-igw
и аттачим его к VPC

## Subnets
Подсети должны быть в разных AZ!

eks-staging-subnet-public-1
10.30.1.0/24 - public

eks-staging-subnet-public-2
10.30.2.0/24
Modify auto-assign IP settings


eks-staging-subnet-private-1
10.30.0.0/24
eks-staging-subnet-private-2
10.30.4.0/24

## NAT Gateway
eks-staging-gw
линкуем к публичной сети
создаём EIP

## Route tables
Для публичной сети RT уже создана, переименуем в eks-staging-public-1
Destination 0.0.0.0/0, Target IGW
На вкладке Subnet association добавляем публичные сети


eks-staging-private-1
Destination 0.0.0.0/0, Target Internet Gateway
На вкладке Subnet association добавляем приватные сети

## EKS
eks-staging

### networks
Сети должны быть минимум в 2х AZ
Выбрать Public and private
