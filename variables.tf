
variable "namespace" {
  description = "value"
  type        = string
}

# variable "ssh_keypair" {
#   description = "SSH keypair to use for EC2 instance"
#   default     = null
#   type        = string
# }

variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-2"
  type        = string
}

variable "project_tags" {
  description = "Tags to apply resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}
