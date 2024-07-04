output "vpc_id" {
  value = aws_vpc.test_vpc.id
}

output "subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "ec2_instance1_id" {
  value = aws_instance.ec2_instance1.id
}

output "ec2_instance2_id" {
  value = aws_instance.ec2_instance2.id
}
