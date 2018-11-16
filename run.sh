#!/bin/sh

function secret_to_env()
{
	envname=$1
	if [ -f "/run/secrets/$envname" ]
	then
		export $envname=`cat /run/secrets/$envname`
	fi
}

secret_to_env AWS_ACCESS_KEY_ID
secret_to_env AWS_SECRET_ACCESS_KEY
secret_to_env AWS_DEFAULT_REGION

aws $@
