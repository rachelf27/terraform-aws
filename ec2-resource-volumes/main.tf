provider "aws" {
    region = "eu-west-1"
}

resource "aws_instance" "tags-test" {
    ami = "ami-0ac43988dfd31ab9a"
    instance_type = "t2.micro"
}

# Create the resource addressing block
 resource "aws_ebs_volume" "example" {
   availability_zone = "eu-west-1a"
   size              = 40
 }

 resource "aws_volume_attachment" "ebs_att" {
   device_name = "/dev/sdh"
   volume_id   = aws_ebs_volume.example.id
   instance_id = aws_instance.tags-test.id
 }