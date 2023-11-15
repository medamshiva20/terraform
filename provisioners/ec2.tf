resource "aws_instance" "provisioner"{
    ami = "ami-03265a0778a880afb"
    instance_type = "t2.micro"

    provisioner "local-exec" {
      command = "echo ${self.private_ip} > inventory"
    }
}

resource "aws_instance" "remote" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  security_groups = ["sg-098c47830cf6c9699"]
  subnet_id = "subnet-0b40ce56046b04d11"
  
  connection {
    type = "ssh"
    user = "centos"
    password = "DevOps321"
    host = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [ 
        "sudo yum install nginx -y",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx",
       # "sudo yum install openjdk-11-jdk",
        "sudo yum install maven -y"


     ]
  }
}