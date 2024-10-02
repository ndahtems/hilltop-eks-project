/*terraform {
  backend "s3" {
    bucket = "hilltop-bucket"
    region = "eu-north-1"
    key    = "jenkins-server/terraform.tfstate"
  */
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

  
provider "aws" {
  region = "eu-north-1"
}
