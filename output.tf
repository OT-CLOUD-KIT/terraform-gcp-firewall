output "ingress_firewall_rules" {
  value = [for rule in values(google_compute_firewall.ingress_rules) : rule.name]
}

output "egress_firewall_rules" {
  value = [for rule in values(google_compute_firewall.egress_rules) : rule.name]
}