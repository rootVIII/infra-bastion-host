
output "public_ip" {
  description = "IP address of bastion host EC2 instance"
  value       = aws_instance.bastion_host.public_ip
}

output "private_IP" {
  description = "IP address of private EC2 instance"
  value       = aws_instance.private_host.private_ip
}
