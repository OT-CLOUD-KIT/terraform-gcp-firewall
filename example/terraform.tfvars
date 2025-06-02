project_id               = "nw-opstree-dev-landing-zone"
region                   = "us-central1"
network                  = "default"
ingress_name             = "new-ingress"
ingress_service_accounts = ["260805399744-compute@developer.gserviceaccount.com"]
ingress_network_tags     = []
ingress_rules = [
  {
    name        = "ingress-1"
    priority    = 100
    protocol    = "tcp"
    ports       = ["80", "443"]
    source_ranges = ["0.0.0.0/0"]
  },
  {
    name        = "ingress-2"
    priority    = 200
    protocol    = "icmp"
    ports       = []
    source_ranges = ["10.0.0.0/24"]
  }
]

egress_name             = "new-egress"
egress_service_accounts = []
egress_network_tags     = ["network-tag"]
egress_rules = [
  {
    name               = "egress-1"
    priority           = 65535
    protocol           = "all"
    ports              = []
    destination_ranges = ["0.0.0.0/0"]
  }
]