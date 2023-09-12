# resource "aws_instance" "Roboshop"{
#     for_each = var.instances
#     ami = var.ami_id
#     instance_type = each.value
#     tags = {
#         Name = each.key
#     }
# }

# #output "aws_instance_info"{
# #   value = aws_instance.Roboshop
# #}



# #If web give public IP else you give private IP
# resource "aws_route53_record" "www" {
#   for_each = aws_instance.Roboshop
#   zone_id = var.zone_id
#   name    = "${each.key}.${var.domain}"
#   type    = "A"
#   ttl     = 1
#   records = [each.key == "Web" ? each.value.public_ip : each.value.private_ip]
# }
