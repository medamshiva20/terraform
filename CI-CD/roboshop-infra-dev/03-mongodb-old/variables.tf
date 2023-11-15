variable "project_name" {
  default = "roboshop"
}

variable "env" {
  default = "Dev"
}

variable "common_tags" {
  default = {
    project = "roboshop"
    Component = "MongoDB"
    Environment = "DEV"
    Terraform = "true"
  }
}

variable "zone_name" {
  default = "medamdevops.online"
}

variable "mongodb_record_name" {
  default = "mongodb"
}