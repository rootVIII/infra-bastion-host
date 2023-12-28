
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = "infra-key"
  public_key = tls_private_key.private_key.public_key_openssh
  provisioner "local-exec" {
    command = "echo '${tls_private_key.private_key.private_key_pem}' > infra-key.pem"
  }
}

resource "aws_instance" "bastion_host" {
  ami                    = var.ami
  instance_type          = "t2.nano"
  vpc_security_group_ids = [var.default_security_group_id]
  subnet_id              = var.public_subnet_id

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
