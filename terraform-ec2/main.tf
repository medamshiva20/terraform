module "ec2" {
  source = "../terraform-modules-ec2"
  ami_id = var.ami_id # What is the AMI ID you want
  instance_type = var.instance_type # What is the instance_type you want 
}