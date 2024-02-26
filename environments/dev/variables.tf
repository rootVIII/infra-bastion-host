
variable "namespace" {
  description = "value"
  type        = string
}

variable "environment" {
  description = "Current infrastructure environment"
  type        = string
}

variable "region" {
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
