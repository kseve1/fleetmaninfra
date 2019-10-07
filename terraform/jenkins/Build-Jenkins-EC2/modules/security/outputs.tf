output "security_group_name" {
  description = "the security group name"
  value       = aws_security_group.red-sg-2.name
}
