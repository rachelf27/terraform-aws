output "private_ip_1" {
    value = aws_instance.outputs_example_1.private_ip
        description = "private ip for outputs example 1"

}

output "private_ip_2" {
    value = aws_instance.outputs_example_2.private_ip
    description = "private ip for outputs example 2"
}