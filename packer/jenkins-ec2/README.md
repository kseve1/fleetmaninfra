Packer area to create a jenkins ec2 instance using an ansible role

Packer image currently creates an AMI with a Name tag Blue-team-jenkins+A+D+K+T

Jenkins in configured via the jenkins Ansible role.

The following tools are currently provisioned using the relevant install_$TOOL.sh script (should look at ansible roles with ore time)

1. Ansible
2. Docker
3. Kubectl
4. Terraform (/usr/local/bin)
5. Packer (/usr/local/bin)
6. aws-iam-authenticator (/usr/local/bin)
