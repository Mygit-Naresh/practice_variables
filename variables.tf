variable "ami-id" {
  type = string
  default = "ami-0f3c7d07486cad139"
}
variable "ec2-type" {
  type = string
  default = "t2.micro"
}
variable "tag_names" {
  type = map
  default =  {
        Name =  
        Terraform = "True"
        Project = "roboshop"
        company = "eternaltrainings.online"
        Enviroment = "Dev"
  }
}
