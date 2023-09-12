resource "aws_instance" "webserver"{
   ami = var.ami_id
   instance_type = var.instance_type
   security_groups = [aws_security_group.allow_all.name]
   
   #tags={
    #   Name="MongoDB"
     #  Environment="DEV"
      # Terraform="true"
       #Project="ROboshop"
       #Component="MongoDB"
   #}
   tags = var.tags
}