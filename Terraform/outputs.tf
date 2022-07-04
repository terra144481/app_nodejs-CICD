output "instance_public_ip_develop_server" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.develop.public_ip
}

output "public_dns_develop_server" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.develop.public_dns
}

output "instance_public_ip_product_server" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.product.public_ip
}

output "public_dns_product_server" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.product.public_dns
}
