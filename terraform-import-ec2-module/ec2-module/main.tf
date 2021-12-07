resource "aws_instance" "ec2-module-import" {
    ami = data.aws_ami.aws_linux.id
    instance_type = "t2.micro"
}

data "aws_ami" "aws_linux" {
    most_recent = true

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-2.0.20210617.0-x86_64-gp2"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["137112412989"]
}

#terraform import module.ec2_import.aws_instance.ec2-module-import i-0235b8d3528f07ea9