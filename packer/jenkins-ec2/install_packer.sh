#!/bin/bash

VERSION="1.4.4"

sudo apt-get update

sudo apt-get install wget unzip -y

wget https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_linux_amd64.zip

# Later add SHA256 and confirm downloaded file matches
#LOCAL_SHA256=`sha256 ./packer_${VERSION}_linux_amd64.zip`

sudo unzip ./packer_${VERSION}_linux_amd64.zip -d /usr/local/bin/
