output "vault_service_config_name" {
  description = "Name of generated Vault configuration file"
  value       = docker_config.vault_hcl.name
}