terraform {
  backend "s3" {
    key = "ecr/terraform.tfstate"
  }
}
