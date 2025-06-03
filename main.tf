resource "google_compute_firewall" "ingress_rules" {
  for_each = {
    for entry in flatten([
      for target_type, target_val in {
        "tags" = var.ingress_network_tags
        "sa"   = var.ingress_service_accounts
        } : [
        for idx, rule in var.ingress_rules : {
          key         = "${var.ingress_name}-${target_type}-${idx}"
          rule        = rule
          target_type = target_type
          target_val  = target_val
        }
      ] if length(target_val) > 0
    ]) : entry.key => entry
  }

  name      = each.value.rule.name
  network   = var.network
  direction = "INGRESS"
  priority  = each.value.rule.priority

  allow {
    protocol = each.value.rule.protocol
    ports    = each.value.rule.ports
  }

  source_ranges = length(each.value.rule.source_ranges) > 0 ? each.value.rule.source_ranges : var.default_ingress_source_ranges

  target_tags             = each.value.target_type == "tags" ? each.value.target_val : null
  target_service_accounts = each.value.target_type == "sa" ? each.value.target_val : null
}

resource "google_compute_firewall" "egress_rules" {
  for_each = {
    for entry in flatten([
      for target_type, target_val in {
        "tags" = var.egress_network_tags
        "sa"   = var.egress_service_accounts
        } : [
        for idx, rule in var.egress_rules : {
          key         = "${var.egress_name}-${target_type}-${idx}"
          rule        = rule
          target_type = target_type
          target_val  = target_val
        }
      ] if length(target_val) > 0
    ]) : entry.key => entry
  }

  name      = each.value.rule.name
  network   = var.network
  direction = "EGRESS"
  priority  = each.value.rule.priority

  allow {
    protocol = each.value.rule.protocol
    ports    = each.value.rule.ports
  }

  destination_ranges = length(each.value.rule.destination_ranges) > 0 ? each.value.rule.destination_ranges : var.default_egress_destination_ranges

  target_tags             = each.value.target_type == "tags" ? each.value.target_val : null
  target_service_accounts = each.value.target_type == "sa" ? each.value.target_val : null
}