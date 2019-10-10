terraform {
  backend "s3" {
    key = "ecr/positionsimulator/terraform.tfstate"
  }
}
