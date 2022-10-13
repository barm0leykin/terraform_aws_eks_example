#!/bin/sh


aws eks create-cluster \
	--region us-west-2 \
	--profile aws-eks-test \
	--name aws-eks-test \
	--kubernetes-version 1.21 \
	--role-arn arn:aws:iam::691889635880:role/k8s-testcluster-role \
	--resources-vpc-config subnetIds=subnet-065292d0e6abb34bc,subnet-0bed681cb074db448,subnet-0352a2addd013b8e2,securityGroupIds=sg-019f0b7291543066c,endpointPublicAccess=false,endpointPrivateAccess=true \
	--logging '{"clusterLogging":[{"types":["api","audit","authenticator","controllerManager","scheduler"],"enabled":true}]}' \
	--tags Name=aws-eks-test,createdby=vnatrov,environment=dev


# eks-cluster-role
