output "room1_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.room1.id
}

output "room1_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.room1.public_ip
}

output "room2_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.room2.id
}

output "room2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.room2.public_ip
}