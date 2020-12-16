data "local_file" "vault_hcl" {
  filename = "${path.module}/vault-config.hcl"
}
data "template_file" "vault_hcl" {
  template = file("${path.module}/vault-config.hcl")
}