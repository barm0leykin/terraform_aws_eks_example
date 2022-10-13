#!/bin/sh

# first unset variables:
unset AWS_PROFILE AWS_SESSION_TOKEN AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY

set -e -u

login=jdoe
session_name=staging

role_arn=arn:aws:iam::691889635880:role/akudryashov
mfa_arn=arn:aws:iam::114933429123:mfa/akudryashov

if [ $# -ge 1 ]; then
	session_name="$1"
	shift
fi

if [ -z "${AWS_MFA_CODE:-}" ]; then
	if [ ! -t 0 ]; then
		echo "stdin not connected to a TTY - unable to use MFA" >&2
		return 2
	fi

	read -p "MFA code: " AWS_MFA_CODE
	if [ -z "${AWS_MFA_CODE}" ]; then
		echo "No MFA code given, exiting" >&2
		exit 1
	fi
fi

aws sts assume-role \
	--role-arn "${role_arn}" \
	--role-session-name "${session_name}" \
	--serial-number "${mfa_arn}" \
	--token-code "${AWS_MFA_CODE}" |
jq -r '.Credentials|"\(.SessionToken)\n\(.AccessKeyId)\n\(.SecretAccessKey)"' |
for v in AWS_SESSION_TOKEN AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY; do
	read value
	cleared=`echo -n "$value" | tr -d -c 'A-Za-z0-9+/='`
	if [ "$cleared" != "$value" ]; then
		echo "invalid base64 value for $v" >&2
		exit 2
	fi
	echo "$v=$cleared\nexport $v"
done

AWS_PROFILE="${session_name}"
export AWS_PROFILE
