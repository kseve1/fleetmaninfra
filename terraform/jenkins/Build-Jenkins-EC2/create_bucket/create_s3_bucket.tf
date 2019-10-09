provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "Blue-Team-Terraform-Jenkins" {
  bucket = var.bucket_name
  region = "eu-central-1"
  tags = {
    Name  = var.name_tag
    Owner = var.owner_tag
  }
}
