resource "aws_instance" "module_1" {
    ami = data.aws_ami.windows.id
    instance_type = "t2.micro"
}

data "aws_ami" "windows" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-2021.06.09"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["801119661308"] # Canonical
}