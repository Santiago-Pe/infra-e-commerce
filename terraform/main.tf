provider "aws" {
  region = var.region
  profile = "mundo2"
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh_"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

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

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = var.subnet_id

  associate_public_ip_address = true

  tags = {
    Name = "UbuntuPublicInstance"
  }
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

output "instance_id" {
  value = aws_instance.example.id
}
