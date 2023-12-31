resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Roboshop"
    Environment = "DEV"
    Terraform = "true"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Roboshop_public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Roboshop_private"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Roboshop"
  }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    tags = {
      Name = "Roboshop_public"
    }
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id
    tags = {
      Name = "Roboshop_private"
    }
}

resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

#Create one security group and open only port no 80 to public, 22 to open only from your laptop 
resource "aws_security_group" "allow_http_ssh"{
    name = "allow_http_ssh"
    description = "allow tcp traffic" # if you want you can keep this in varaible also no problem
    vpc_id = aws_vpc.main.id

    ingress {
    description      = "HTTPS from internet"
    from_port        = 80 # this is number
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   ingress {
    description      = "SSH from my Laptop"
    from_port        = 22 # this is number
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   }
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # Allowing all ports
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_http_ssh"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "devops_new.pub"
  public_key = file("${path.module}/devops.pub")
}

resource "aws_instance" "web"{
   ami = "ami-03265a0778a880afb"
   instance_type = "t2.micro"
   subnet_id = aws_subnet.public.id
   vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
   associate_public_ip_address = true
   key_name = aws_key_pair.deployer.key_name
   tags= {
      Name= "web"
   }
}