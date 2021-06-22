#Create your provider configuration
provider "aws" {
    region = "eu-west-1"
}

#Create an EC2 Instance with Tags
resource "aws_instance" "windows-tags" {
    ami = "ami-00044f922345e6b31"
    instance_type = "t2.micro"
    tags = {
        Name = "windows_terra_tags"
        environment = "staging"
        application = "web"
    }
  
}
