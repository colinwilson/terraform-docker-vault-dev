data "template_file" "vault_hcl" {
  template = file("${path.module}/vault-config.hcl")

  vars = {
    enable_ui = var.enable_ui == true ? true : false
  }
}