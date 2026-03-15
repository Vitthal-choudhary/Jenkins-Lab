provider "aws" {
  region = "ap-south-1"
}

# Security Group to allow SSH
resource "aws_security_group" "devops_sg" {

  name        = "devops-security-group"
  description = "Allow SSH access"

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
}

# EC2 Instance
resource "aws_instance" "devops_server" {

  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"

  key_name = "VLE5"

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "VLE5"
  }

}
