#!/bin/bash

sudo apt-get update

sudo apt-get install curl -y

curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator

chmod +x /usr/local/bin/aws-iam-authenticator
