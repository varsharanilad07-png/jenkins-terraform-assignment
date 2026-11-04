output "container_name" {
  description = "Name of the deployed Docker container"
  value       = docker_container.website.name
}

output "website_url" {
  description = "URL of the deployed website"
  value       = "http://localhost:8081"
}