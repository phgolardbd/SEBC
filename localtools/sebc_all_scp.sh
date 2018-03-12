#!/bin/bash

localpath=$1

if [ -z "$2" ]
then
	remotepath="~"
else
	remotepath=$2
fi

scp $localpath phadmin@ec2-54-186-42-97.us-west-2.compute.amazonaws.com:$remotepath
scp $localpath phadmin@ec2-34-216-137-100.us-west-2.compute.amazonaws.com:$remotepath
scp $localpath phadmin@ec2-54-186-175-133.us-west-2.compute.amazonaws.com:$remotepath
scp $localpath phadmin@ec2-34-209-47-171.us-west-2.compute.amazonaws.com:$remotepath
scp $localpath phadmin@ec2-54-213-161-133.us-west-2.compute.amazonaws.com:$remotepath