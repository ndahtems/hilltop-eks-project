terraform {
  backend "s3" {
    bucket = "hilltop-app-bucket"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
  }
}