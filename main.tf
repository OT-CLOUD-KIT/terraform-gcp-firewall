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

  source_ranges = var.ingress_source_cidrs

  target_tags             = each.key == "tags" ? each.value : null
  target_service_accounts = each.key == "sa" ? each.value : null

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
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

  destination_ranges = var.egress_source_cidrs

  target_tags             = each.key == "tags" ? each.value : null
  target_service_accounts = each.key == "sa" ? each.value : null

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }
}

