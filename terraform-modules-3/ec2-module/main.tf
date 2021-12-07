#AWS Instance
resource "aws_instance" "ec2_linux" {
    ami = data.aws_ami.linux.id
    instance_type = var.instance_type
    availability_zone = var.availability_zone
}

#AMI Filter for Amazon Linux
data "aws_ami" "linux" {
    most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20210617.0-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}

#EBS Volume and Attachment
resource "aws_ebs_volume" "linux_vol" {
    availability_zone = var.availability_zone
    size = 40
    tags = {
        Name = "Data Drive"
    }
}

resource "aws_volume_attachment" "ebs_att" {
    device_name = "/dev/xvda1"
    volume_id = "${aws_ebs_volume.linux_vol.id}"
    instance_id = "${aws_instance.ec2_linux.id}"
}

#Cloudwatch Metric
resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {
  alarm_name          = "cpu_utilization"
  alarm_description   = "metric to monitor ec2 cpu utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  threshold           = 80
  period              = 120
  namespace   = "AWS/EC2"
  metric_name = "CPUUtilization"
  statistic   = "Average"
  insufficient_data_actions = []

  dimensions = {
    "InstanceId" = aws_instance.ec2_linux.id
  }

}


