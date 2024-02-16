
output "aws_region" {
  description = "Current region"
  value       = var.region
}

output "vpc_id" {
  description = "VPC ID"
  # Previously, the value was set as shown below when
  # the VPC module was used in network/main.tf:
  # value       = module.vpc.default_security_group_id
  value = aws_vpc.dev_vpc.id
}

output "public_subnet_id" {
  description = "VPC Public Subnet"
  # value       = module.vpc.public_subnets[0]
  value = aws_subnet.dev_subnet_public_1.id
}

output "private_subnet_id" {
  description = "VPC Public Subnet"
  value       = aws_subnet.dev_subnet_private_1.id
}
