variable "ami_id"{
    type = string
    default = "ami-03265a0778a880afb"
}

variable "instance_type"{
    default = "t2.micro"
}

# variable "instance_names"{
#     type = list 
#     default = ["MongoDB", "Cart", "Catalogue", "User", "Redis", "MySql", "RabbitMQ", "Shipping", "Payment", "Web"]
# }

# variable "zone_id"{
#     default = "Z03138242AU77P961FWHN"
# }

# variable "domain"{
#     default = "medamdevops.online"
# }