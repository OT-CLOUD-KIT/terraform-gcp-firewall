module "firewall_rules" {
  source = "./module"
  network          = var.network
  ingress_name     = var.ingress_name
  ingress_priority = var.ingress_priority
  ingress_rules            = var.ingress_rules
  ingress_service_accounts = var.ingress_service_accounts
  ingress_network_tags     = var.ingress_network_tags
  egress_name     = var.egress_name
  egress_priority = var.egress_priority
  egress_rules            = var.egress_rules
  egress_service_accounts = var.egress_service_accounts
  egress_network_tags     = var.egress_network_tags
}