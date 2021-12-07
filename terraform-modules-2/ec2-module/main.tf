#AWS Instance
resource "aws_instance" "windows" {
    ami = data.aws_ami.windows.id
    instance_type = "t2.micro"
    availability_zone = var.availability_zone
}

#AMI Filter for Windows Server 2019 Base
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

#EBS Volume and Attachment
resource "aws_ebs_volume" "windows" {
    availability_zone = var.availability_zone
    size = 40
    tags = {
        Name = "Data Drive"
    }
}

resource "aws_volume_attachment" "ebs_att" {
    device_name = "dev/sda1"
    volume_id = "${aws_ebs_volume.windows.id}"
    instance_id = "${aws_instance.windows.id}"
}