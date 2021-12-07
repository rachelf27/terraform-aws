provider "aws" {
    region = "us-east-1"
}



resource "aws_instance" "second_instance" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
}

resource "aws_instance" "move_this" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  tags = {
    Name = "moved"
  }
}
