
resource "aws_key_pair" "ssh_key" {
  key_name   = "infra-key"
  public_key = file("infra-key.pub")
}

resource "aws_instance" "bastion_host" {
  ami                    = var.ami
  instance_type          = "t2.nano"
  vpc_security_group_ids = [var.default_security_group_id]
  subnet_id              = var.public_subnet_id
  key_name               = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "BastionHost"
  }
}

resource "aws_instance" "private_host" {
  ami                    = var.ami
  instance_type          = "t2.nano"
  vpc_security_group_ids = [var.default_security_group_id]
  subnet_id              = var.private_subnet_id
  tags = {
    Name = "PrivateHost"
  }
}
