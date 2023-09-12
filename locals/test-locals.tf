resource "aws_instance" "conditions"{
    #count = 10
    ami = local.ami_id #devops-practice in us-east-1
    instance_type = local.instance_type
    #instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "MySql" ? "t3.medium" : "t2.micro"
    tags = {
        #Name = var.instance_names[count.index]
        Name = "work-station"
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
  public_key = local.key_public
}

# resource "aws_instance" "filefunction"{
#     ami = var.ami_id
#     instance_type = local.instance_type
#     key_name = aws_key_pair.deployer.key_name
# }