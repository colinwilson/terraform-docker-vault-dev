resource "docker_config" "vault_hcl" {
  name = "vault_hcl-${replace(timestamp(), ":", ".")}"
  data = base64encode(data.template_file.vault_hcl.rendered)

  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }
}