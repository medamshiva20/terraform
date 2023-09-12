# data "aws_ami" "ami_id"{
#     most_recent = true # It will fetch the latest updated AMI id
#     owners = ["151587693115"] # or else you can give account id of AWS 
    
#     filter {
#       name = "nginx-ami"
#       values = ["ami-*"]
#     }
# }

# output "ami_id" {
#    value = data.aws_ami.ami_id.id
# }

data "aws_vpc" "default" {
  default = true
}

output "aws_vpc" {
  value = data.aws_vpc.default
}

resource "aws_security_group" "allow-http" {
   name = "some-name-another-name"
    description = "allowing all ports" # if you want you can keep this in varaible also no problem

    ingress {
    description      = "Allowing all inbound traffic"
    from_port        = 80 # this is number
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # Allowing all ports
    cidr_blocks      = ["0.0.0.0/0"]
  }
}