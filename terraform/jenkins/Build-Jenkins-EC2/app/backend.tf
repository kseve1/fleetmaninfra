terraform {
  backend "s3" {
    key = "core/terraform_deploy_ec2.tfstate"
  }
}
