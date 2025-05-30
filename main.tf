resource "google_compute_firewall" "ingress_rules" {
  for_each = {
    for k, v in {
      "tags" = var.ingress_network_tags
      "sa"   = var.ingress_service_accounts
    } : k => v if length(v) > 0
  }

  name      = "${var.ingress_name}-${each.key}"
  network   = var.network
  priority  = var.ingress_priority
  direction = "INGRESS"

  target_tags             = each.key == "tags" ? each.value : null
  target_service_accounts = each.key == "sa" ? each.value : null

  dynamic "allow" {
    for_each = var.ingress_rules
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }

  source_ranges = flatten([for rule in var.ingress_rules : rule.cidr_blocks])
}

resource "google_compute_firewall" "egress_rules" {
  for_each = {
    for k, v in {
      "tags" = var.egress_network_tags
      "sa"   = var.egress_service_accounts
    } : k => v if length(v) > 0
  }

  name      = "${var.egress_name}-${each.key}"
  network   = var.network
  priority  = var.egress_priority
  direction = "EGRESS"

  target_tags             = each.key == "tags" ? each.value : null
  target_service_accounts = each.key == "sa" ? each.value : null

  dynamic "allow" {
    for_each = var.egress_rules
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }

  destination_ranges = flatten([for rule in var.egress_rules : rule.destination_ranges])
}