
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_public_subnet" {
  description = "Public subnet for VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vpc_private_subnet" {
  description = "Private subnet for VPC"
  type        = string
  default     = "10.0.2.0/24"
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
  vpc_az = "${var.region}a"
}
