output "ingress_firewall_rule_ids" {
  description = "IDs of the created ingress firewall rules"
  value       = [for rule in google_compute_firewall.ingress_rules : rule.id]
}

output "egress_firewall_rule_ids" {
  description = "IDs of the created egress firewall rules"
  value       = [for rule in google_compute_firewall.egress_rules : rule.id]
}

output "ingress_firewall_rule_names" {
  description = "Names of the created ingress firewall rules"
  value       = [for rule in google_compute_firewall.ingress_rules : rule.name]
}

output "egress_firewall_rule_names" {
  description = "Names of the created egress firewall rules"
  value       = [for rule in google_compute_firewall.egress_rules : rule.name]
}
