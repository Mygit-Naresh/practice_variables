
#### VPC BLOCK #######
resource aws_vpc "tfvpc" {
  cidr_block = "172.29.0.0/16"
  tags = var.tag_names 
 
}
#################
resource "aws_instance" "aws" {
 ami           = var.ami-id # us-east-1 devops-practice AMi
 instance_type = var.ec2-type
   tags = {
    tags = var.tag_names
   }

}
######### create private subnet #########
resource aws_subnet "tfsubnetprivate" {
  vpc_id   =  aws_vpc.tfvpc.id
  cidr_block = "172.29.1.0/24"
   availability_zone = "us-east-1a"
   tags = var.tag_names
}
############## Create public subnet ############
resource aws_subnet "tfsubnetpublic" {
    vpc_id   =  aws_vpc.tfvpc.id
    cidr_block = "172.29.2.0/24"
    availability_zone = "us-east-1b"
    tags = {
      Name = "Terraform public subnet"
     }
}
#################### internet gateway #############
resource aws_internet_gateway  "tfigw" {
     vpc_id   =  aws_vpc.tfvpc.id
   tags = {
      Name = "TerraformIGW"
     }
}

#### SG BLOCK #######
resource "aws_security_group" "sgtf" {
    name        = "sgtf2"
    description = "created sg from tf and allow all in and out bound rules"
    vpc_id   =  aws_vpc.tfvpc.id

    ingress {
    description = "tf-allow all"   
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   
    }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   

   }
} 