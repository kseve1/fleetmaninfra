#!/bin/bash

VERSION=0.12.10

sudo apt-get update

sudo apt-get install wget unzip -y

wget https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip

# Later add SHA256 and confirm downloaded file matches
#LOCAL_SHA256=`sha256 ./terraform_${VERSION}_linux_amd64.zip`

sudo unzip ./terraform_${VERSION}_linux_amd64.zip -d /usr/local/bin/
