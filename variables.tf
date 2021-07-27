# Required variables
variable "hostname" {
  type        = string
  description = "Hostname for Vault route."
}

variable "live_cert" {
  type        = bool
  description = "Deploy Vault with a production (live) or staging SSL certificate."
  default     = false
}

# Optional variables
variable "networks" {
  type        = list(string)
  description = "List of networks to connect Vault to."
  default     = ["traefik"]
}

variable "enable_ui" {
  type        = bool
  description = "Enable the Vault web-based user interface (UI)"
  default     = true
}

variable "vault_version" {
  type        = string
  description = "Vault Docker image version."
  default     = "1.7.3"
}