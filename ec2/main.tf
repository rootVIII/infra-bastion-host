
module "ec2_instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "5.5.0"
  for_each               = toset(["1", "2"])
  name                   = "instance-${each.key}"
  ami                    = var.ami
  instance_type          = "t2.nano"
  key_name               = "ec2-user"
  vpc_security_group_ids = [var.default_security_group_id]
  subnet_id              = var.public_subnet_id
  tags                   = var.project_tags
}
