resource "docker_volume" "vault_data" {
  name = "vault_data"
}

resource "docker_volume" "vault_logs" {
  name = "vault_logs"
}

resource "docker_volume" "vault_policies" {
  name = "vault_polices"
}