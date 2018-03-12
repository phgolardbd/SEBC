#!/bin/bash
remhost=$1
localpath=$2

if [ -z "$3" ]
then
	remotepath=~
else
	remotepath=$3
fi

if [ $remhost=lion ]
then
	remurl=ec2-52-42-84-237.us-west-2.compute.amazonaws.com
elif [ remhost=elephant ]
then
	remurl=ec2-34-217-33-110.us-west-2.compute.amazonaws.com
elif [ remhost=tiger ]
then
	remurl=ec2-54-245-39-188.us-west-2.compute.amazonaws.com
elif [ remhost=horse ]
then
	remurl=ec2-54-244-61-117.us-west-2.compute.amazonaws.com
elif [ remhost=monkey ]
then
	remurl=ec2-34-209-244-168.us-west-2.compute.amazonaws.com
else
 echo "mistake remote host not existing"
fi

scp $localpath phadmin@$remurl:$remotepath