terraform {
  backend "s3" {
    key = "eks-PROD/terraform.tfstate"
  }
}
