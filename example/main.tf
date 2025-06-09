module "firewall_rules" {
  source                            = "./module"
  network                           = var.network
  ingress_name                      = var.ingress_name
  ingress_rules                     = var.ingress_rules
  ingress_service_accounts          = var.ingress_service_accounts
  ingress_network_tags              = var.ingress_network_tags
  egress_name                       = var.egress_name
  egress_rules                      = var.egress_rules
  egress_service_accounts           = var.egress_service_accounts
  egress_network_tags               = var.egress_network_tags
  default_ingress_source_ranges     = var.default_ingress_source_ranges
  default_egress_destination_ranges = var.default_egress_destination_ranges
}