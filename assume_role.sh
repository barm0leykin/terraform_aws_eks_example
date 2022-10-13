#!/bin/sh

read -r -p "Please input MFA key: " MFA
export MFA

if [ -n "$2" ]; then
    export ARN=$2
else
    export ARN="arn:aws:iam::691889635880:role/akudryashov"
fi


eval $(aws sts assume-role --profile default --role-arn ${ARN} --role-session-name akudryashov --region eu-west-2 --serial-number arn:aws:iam::114933429123:mfa/akudryashov --token-code ${MFA} | jq -r '.Credentials | "export AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey)\nexport AWS_SESSION_TOKEN=\(.SessionToken)\n"')

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN

echo "ARN: $ARN"
echo "AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID"
echo "AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY"
echo "AWS_SESSION_TOKEN: $AWS_SESSION_TOKEN"
