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


Building the DEVELOPMENT AWS EKS environment (Terraform)
Location: fleetmaninfra/terraform/k8s/setup-Blue-team-DEV-eks-cluster
- terraform init -backend-config=backend.hcl
- terraform plan -out plan
- terraform apply plan


Building the PRODUCTION AWS EKS environment (Terraform)
Location: fleetmaninfra/terraform/k8s/setup-Blue-team-PROD-eks-cluster
- terraform init -backend-config=backend.hcl
- terraform plan -out plan
- terraform apply plan


Manually Uploading docker images to ECR (account + repo specific)
- docker tag webapp:latest 090107652998.dkr.ecr.eu-central-1.amazonaws.com/blueteam:fm-webapp
- docker push 090107652998.dkr.ecr.eu-central-1.amazonaws.com/blueteam:fm-webapp

Repeat for queue, api-gateway, position-simulator, position-tracker


Manually start/stop the webapp in the development cluster (in the namespace blue-team-dev)
Location: fleetmaninfra/eks
- aws eks --region eu-central-1 update-kubeconfig --name Blue-team-DEV-terraform-eks-cluster
- kubectl config use-context arn:aws:eks:eu-central-1:090107652998:cluster/Blue-team-DEV-terraform-eks-cluster
- make deloy
- make clean
