
output "aws_region" {
  description = "Current region"
  value       = var.region
}

output "vpc_id" {
  description = "VPC Default Security Group ID"
  value       = module.vpc.default_security_group_id
}

output "public_subnet_id" {
  description = "VPC Public Subnet"
  value       = module.vpc.public_subnets[0]
}

output "private_subnet_id" {
  description = "VPC Public Subnet"
  value       = module.vpc.private_subnets[0]
}

output "aws_security_group" {
  description = "AWS Security Group ARN"
  value       = aws_security_group.ssh_allowed.arn
}
