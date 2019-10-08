# fleetmaninfra
Exercise/project fleetman app (lift and shift)

Create Jenkins EC2 AMI - with ansible/docker/kubectl/terraform (Packer)
Location: fleetmaninfra/packer/jenkins-ec2/
- packer validate packer_jenkins_ami.json
- packer build packer_jenkins_ami.json


S3 Bucket creation (Terraform)
Location: terraform/jenkins/create_bucket
- terraform init
- terraform plan
- terraform apply


Building the Jenkins EC2 instance (Terraform)
Location: fleetmaninfra/terraform/jenkins/Build-Jenkins-EC2/build_jenkins_EC2/app/
- terraform init -backend-config=backend.hcl
- terraform plan
- terraform apply
