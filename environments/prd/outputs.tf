
output "environment" {
  description = "Infrastructure Environment"
  value       = var.environment
}

output "region" {
  description = "region"
  value       = var.region
}

output "bastion_host_ip" {
  description = "Public IP address of public bastion instance/host"
  value       = module.ec2.public_ip
}

output "private_host_ip" {
  description = "Private IP address of private EC2 instance/host"
  value       = module.ec2.private_IP
}
