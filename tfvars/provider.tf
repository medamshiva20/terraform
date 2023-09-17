terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.15.0"
    }
  }

backend "s3"{
  bucket = "roboshop-devops-remote-state"
  key = "terraform.tfstate"
  region = "us-east-1"
  dynamodb_table = "terraform-state-lock"
 }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}