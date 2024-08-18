terraform {
  backend "s3" {
    bucket = "hilltop-app-bucket"
    region = "us-east-1"
    key    = "jenkins-server/terraform.tfstate"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
