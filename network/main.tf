
module "vpc" {
  source                 = "terraform-aws-modules/vpc/aws"
  version                = "5.0.0"
  name                   = local.vpc_name
  cidr                   = var.vpc_cidr
  azs                    = local.vpc_azs
  private_subnets        = var.vpc_private_subnets
  public_subnets         = var.vpc_public_subnets
  enable_nat_gateway     = var.vpc_enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  tags                   = var.project_tags
}

resource "aws_security_group" "ssh_allowed" {
  vpc_id = module.vpc.vpc_id // output from above module at runtime
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.project_tags
}
