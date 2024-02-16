
resource "aws_security_group" "server_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Outbound rule to allow access to web on any port
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
  vpc_security_group_ids      = [aws_security_group.server_sg.id]
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
  vpc_security_group_ids = [aws_security_group.server_sg.id]
  subnet_id              = var.private_subnet_id

  tags = {
    Name = "PrivateHost"
  }
}

