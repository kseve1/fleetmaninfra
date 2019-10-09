terraform {
  backend "s3" {
    key = "eks-DEV/terraform.tfstate"
  }
}
