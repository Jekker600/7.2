output "instance_ip_addr" {
  value       = aws_instance.server.private_ip 
  description = "The private IP address of the main server instance."
  depends_on = [
    # Security group rule должна быть создана перед тем как можно будет использовать этот ip адрес, иначе сервис будет недоступен
    aws_security_group_rule.local_access, 
  ]
}
