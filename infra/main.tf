provider "aws" {
  region = var.region
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

resource "tls_private_key" "ecommerce" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "llave"
  public_key = tls_private_key.ecommerce.public_key_openssh
}
resource "aws_instance" "ecommerce" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer_key.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = var.subnet_id

  associate_public_ip_address = true

  tags = {
    Name = "UbuntuPublicInstance"
  }
}

