output "instance_id" {
  description = "ID of the EC2 instance"
  value       = docker_container.nginx.id
}
