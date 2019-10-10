terraform {
  backend "s3" {
    key = "ecr/webapp/terraform.tfstate"
  }
}
