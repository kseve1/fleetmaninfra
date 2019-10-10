terraform {
  backend "s3" {
    key = "ecr/positiontracker/terraform.tfstate"
  }
}
