# Создание EKS кластера вручную

```
--------  How to use EKS? -------- 
To create a K8s cluster in EKS you need to do following steps:
1) Setup or preparation steps
 - create AWS account
 - create a VPC - virtual private space
 - create an IAM role with Security Group (or in other words: create AWS user with list of permissions)
2) Create Cluster Control Plane - Master Nodes
 - choose basic information like cluster name and k8s version
 - choose region and VPC for your cluster
 - set security
3) Create Worker Nodes and connect to cluster
The Worker Nodes are some EC2 instances with CPU and storage resources.
 - Create as a Node Group
 - Choose cluster it will attach to
 - Define Security Group, select instance type etc.
```

## IAM Role

Создаём роль EKS - EKS - Cluster - AmazonEKSClusterPolicy 
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
Destination 0.0.0.0/0, Target Internet Gateway
На вкладке Subnet association добавляем публичные сети


eks-staging-private-1
Destination 0.0.0.0/0, Target Nat Gateway
На вкладке Subnet association добавляем приватные сети

## EKS
eks-staging

### networks
Сети должны быть минимум в 2х AZ
Выбрать Public and private

### Node Group
eks-staging-ng-1

#### IAM role for Node Group
eks-staging-iam-nodegroup-role

Choose EC2 from the list of Common use cases under Choose a use case, then choose Next: Permissions.
In the Filter policies box, enter AmazonEKSWorkerNodePolicy. Check the box to the left of AmazonEKSWorkerNodePolicy.
In the Filter policies box, enter AmazonEC2ContainerRegistryReadOnly. Check the box to the left of AmazonEC2ContainerRegistryReadOnly.
