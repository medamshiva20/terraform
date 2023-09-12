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
variable "ingress"{
    type = list 
    default = [
        {
            from_port = 80
            to_port = 80
            description = "Allowing port 80 from public"
            protocol = "tcp"
            cidr_block = ["0.0.0.0/0"]
        },
        {
            from_port = 443
            to_port = 443
            description = "Allowing port 443 from public"
            protocol = "tcp"
            cidr_block = ["0.0.0.0/0"]
        },
        {
            from_port = 22
            to_port = 22
            description = "Allowing port 22 from public"
            protocol = "tcp"
            cidr_block = ["0.0.0.0/0"]
        }
    ]
}