module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = var.project_id
  network_name = var.network_name
  rules        = var.fw_rules
  depends_on = [
    module.vpc
  ]
}