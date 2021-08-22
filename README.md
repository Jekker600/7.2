- Задание_2
- При запуске terraform plan выдает ошибку:
```
terraform plan
╷
│ Error: Reference to undeclared resource
│
│   on outputs.tf line 2, in output "instance_ip_addr":
│    2:   value       = aws_instance.server.private_ip
│
│ A managed resource "aws_instance" "server" has not been declared in the root module.
╵
╷
│ Error: Reference to undeclared resource
│
│   on outputs.tf line 6, in output "instance_ip_addr":
│    6:     aws_security_group_rule.local_access,
│
│ A managed resource "aws_security_group_rule" "local_access" has not been declared in the root module.
╵
```
