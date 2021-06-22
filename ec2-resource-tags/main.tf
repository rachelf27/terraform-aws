#Provider Block
provider "aws" {
    region = "eu-west-1"
}

#EC2 Block w/tags
resource "aws_instance" "tags-test" {
    ami = "ami-0ac43988dfd31ab9a"
    instance_type = "t2.micro"
    #Add Tags
    tags = {
        Name = "test_terra_tag" #Name needs to be a capital N
        environment = "dev"
    }

}