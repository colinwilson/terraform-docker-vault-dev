# Create Vault service
resource "docker_service" "vault-dev" {
  name = "vault-dev"

  task_spec {
    container_spec {
      image = "vault:${var.vault_version}"

      args = ["server"] # automatically loads mounted vault-config.hcl

      env = {
        VAULT_ADDR     = "http://127.0.0.1:8200"
        VAULT_API_ADDR = "http://127.0.0.1:8200"
        SKIP_SETCAP    = true
      }

      labels {
        label = "traefik.enable"
        value = true
      }

      labels {
        label = "traefik.http.routers.vault-dev.rule"
        value = "Host(`${var.hostname}`)"
      }

      labels {
        label = "traefik.http.routers.vault-dev.entrypoints"
        value = "https"
      }

      labels {
        label = "traefik.http.services.vault-dev.loadbalancer.server.port"
        value = "8200"
      }

      labels {
        label = "traefik.http.routers.vault-dev.tls.certresolver"
        value = var.live_cert == false ? "letsEncryptStaging" : "letsEncrypt"
      }

      configs {
        config_id   = docker_config.vault_hcl.id
        config_name = docker_config.vault_hcl.name
        file_name   = "/vault/config/vault-config.hcl"
      }

      mounts {
        source    = docker_volume.vault_data.name
        target    = "/vault/file"
        type      = "volume"
        read_only = false
      }

      mounts {
        source    = docker_volume.vault_logs.name
        target    = "/vault/logs"
        type      = "volume"
        read_only = false
      }

      mounts {
        source    = docker_volume.vault_policies.name
        target    = "/vault/policies"
        type      = "volume"
        read_only = false
      }
    }
    networks = var.networks
  }
}
