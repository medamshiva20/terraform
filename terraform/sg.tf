resource "aws_security_group" "allow_all"{
    name = var.sg_name
    description = "allowing all ports" # if you want you can keep this in varaible also no problem

    ingress {
    description      = "Allowing all inbound traffic"
    from_port        = 0 # this is number
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = var.sg_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # Allowing all ports
    cidr_blocks      = var.sg_cidr
  }
}