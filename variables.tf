# Required variables
variable "hostname" {
  type        = string
  description = "Hostname for traefik route"
}

# Optional variables
variable "networks" {
  type        = list
  description = "List of networks to connect Vault to."
  default     = ["traefik"]
}

variable "image_version" {
  type        = string
  description = "Vault Docker image version."
  default     = "1.6.0"
}