// TODO: replace DEV with current when project is restructured

variable "vpc_name" {
  description = "Development VPC"
  type        = string
  default     = "dev_vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/28"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.101.0/28"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "aws_region" {
  description = "Set in root module"
  type        = string
}

variable "project_tags" {
  description = "Set in root module"
  type        = map(string)
}

locals {
  vpc_azs = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
}
