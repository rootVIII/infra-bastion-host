
variable "ami" {
  description = "Amazon Linux AMI"
  type        = string
  default     = "ami-011ab7c70f5b5170a"
}

variable "project_tags" {
  description = "Set in root module"
  type        = map(string)
}

variable "default_security_group_id" {
  description = "Output default_security_group_id from VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "Output public_subnet ID from VPC"
  type        = string
}

variable "private_subnet_id" {
  description = "Output private_subnet ID from VPC"
  type        = string
}
