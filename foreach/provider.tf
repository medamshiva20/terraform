terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.15.0"
    }
  }

backend "s3"{
  bucket = "roboshop-devops-remote-state"
  key = "foreach-demo"
  region = "us-east-1"
  dynamodb_table = "remote-lock"
 }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}