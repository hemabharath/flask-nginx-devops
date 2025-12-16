provider "aws" {
  region = "ap-south-1"
}

resource "aws_ecr_repository" "flask_repo" {
  name                 = "flask-nginx-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
