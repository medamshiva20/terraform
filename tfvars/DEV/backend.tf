  bucket = "roboshop-devops-remote-state"
  key = "terraform.tfstate"
  region = "us-east-1"
  dynamodb_table = "terraform-state-lock"