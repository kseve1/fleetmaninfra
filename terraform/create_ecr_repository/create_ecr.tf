resource "aws_ecr_repository" "default" {
  name = "${var.repository_name}"
  image_tag_mutability = "IMMUTABLE"
}

