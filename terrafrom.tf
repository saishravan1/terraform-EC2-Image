terraform {
  required_version = "1.5.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.13.1"
    }
  }
  backend "s3" {
  bucket = "saitestbucket1520"
  key    = "terraform.tfstate"
  region = "us-east-2"
  }
}

