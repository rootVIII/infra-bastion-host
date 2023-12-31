
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

variable "single_nat_gateway" {
  description = "Private subnets route all traffic thru single gateway"
  type        = bool
  default     = true
}

variable "one_nat_gateway_per_az" {
  description = "One NAT gateway in public subnet only"
  type        = bool
  default     = false
}

variable "environment" {
  description = "Set in root module"
  type        = string
}

variable "region" {
  description = "Set in root module"
  type        = string
}

variable "project_tags" {
  description = "Set in root module"
  type        = map(string)
}

locals {
  vpc_name = "${var.environment}_vpc"
  vpc_azs  = ["${var.region}a", "${var.region}b", "${var.region}c"]
}
