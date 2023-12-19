
module "network" {
  source       = "./network"
  aws_region   = var.aws_region
  project_tags = var.project_tags
}

module "ec2" {
  source                    = "./ec2"
  project_tags              = var.project_tags
  default_security_group_id = module.network.vpc_id
  public_subnet_id          = module.network.public_subnet_id
  private_subnet_id         = module.network.private_subnet_id
}

# module "load_balancer" {
#   source    = "./load_balancer"
#   namespace = var.namespace
# }
