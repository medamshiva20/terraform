#Values mentioned in varaibles.tf are default values 
#We can always over

variable "ami_id"{
    type = string # This is the data type
    default = "ami-03265a0778a880afb" # this is the default value"
}

variable "instances"{
    type = map 
    default = {
        MongoDB = "t3.medium"
        MySql = "t3.medium"
        Redis = "t2.micro"
        RabbitMQ = "t2.micro"
        Catalogue = "t2.micro"
        User = "t2.micro"
        Cart = "t2.micro"
        Shipping = "t2.micro"
        Payment = "t2.micro"
        Web = "t2.micro"
    }
}

variable "domain"{
    type = string
    default = "medamdevops.online"
}

variable "zone_id"{
    default = "Z03138242AU77P961FWHN"
}

variable "sg_name" {
    default = "allow-all"
  
}

variable "sg_cidr" {
  default = ["0.0.0.0/0"]
}