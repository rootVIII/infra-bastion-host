
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    # random = {
    #   source  = "hashicorp/random"
    #   version = "~> 3.6"
    # }
    # cloudinit = {
    #   source  = "hashicorp/cloudinit"
    #   version = "~> 2.3"
    # }
  }
  required_version = ">=1.6.0"
}

provider "aws" {
  region = var.aws_region
}
