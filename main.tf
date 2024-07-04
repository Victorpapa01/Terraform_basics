provider "aws" {
  region = var.region
}

resource "aws_vpc" "test_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "test_vpc"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.test_vpc.id
  cidr_block        = var.subnet_cidr
  map_public_ip_on_launch = false
  tags = {
    Name = "private_subnet"
  }
}

resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.test_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2_sg"
  }
}

resource "aws_instance" "ec2_instance1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "ec2_instance1"
  }
}

resource "aws_instance" "ec2_instance2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_subnet.id
  security_groups = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "ec2_instance2"
  }
}
