# fleetmaninfra
Exercise/project fleetman app (lift and shift)


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
