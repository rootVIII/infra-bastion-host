resource "aws_security_group" "bastion_sg" {
  vpc_id      = var.vpc_id
  description = "Security group for bastion host"

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

resource "aws_security_group" "private_instance_sg" {
  vpc_id      = var.vpc_id
  description = "Security group for private EC2 instance"

  # Allow SSH from the bastion host security group
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "infra-key"
  public_key = file("infra-key.pub")
}

resource "aws_instance" "bastion_host" {
  ami                         = var.ami
  instance_type               = "t2.nano"
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  subnet_id                   = var.public_subnet_id
  key_name                    = aws_key_pair.ssh_key.key_name
  associate_public_ip_address = "true"

  tags = {
    Name = "BastionHost"
  }
}

resource "aws_instance" "private_host" {
  ami                    = var.ami
  instance_type          = "t2.nano"
  vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
  subnet_id              = var.private_subnet_id
  key_name               = aws_key_pair.ssh_key.key_name
  tags = {
    Name = "PrivateHost"
  }
}

