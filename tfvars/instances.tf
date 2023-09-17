resource "aws_instance" "Roboshop" {
    for_each = var.instances
    ami = var.ami_id
    instance_type = each.value
    tags = {
      Name = each.key
    } 
}

#If web give public IP else you give private IP
resource "aws_route53_record" "www" {
  for_each = aws_instance.Roboshop
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [each.key == "Web" ? each.value.public_ip : each.value.private_ip]
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = "Allowing all ports" # You can keep this in variable

  ingress {
       description      = "Allowing all inbound traffic"
       from_port        = 0
       to_port          = 0
       protocol         = "tcp"
       cidr_blocks      = var.sg_cidr
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.sg_cidr
  }
}