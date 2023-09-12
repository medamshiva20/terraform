resource "aws_instance" "conditions"{
    count = 1
    ami = var.ami_id
    instance_type = var.instance_type
    #instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "MySql" ? "t3.medium" : "t2.micro"
    tags = {
        #Name = var.instance_names[count.index]
        Name = "Work-Station"
    }
}

# resource "aws_route53_record" "record" {
#   count = 10
#   zone_id = var.zone_id
#   name    = "${var.instance_names[count.index]}.${var.domain}" #Interpolation
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.conditions[count.index].private_ip]
# }

resource "aws_key_pair" "deployer" {
  key_name   = "devopsnew.pub"
  public_key = file("${path.module}/devops.pub")
}

resource "aws_instance" "filefunction"{
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = aws_key_pair.deployer.key_name
}