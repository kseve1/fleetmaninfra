terraform {
  backend "s3" {
    key = "core/terraform.tfstate"
  }
}
