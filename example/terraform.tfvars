project_id               = "nw-opstree-dev-landing-zone"
region                   = "us-central1"
network                  = "default"
ingress_name             = "new-ingress"
ingress_priority         = 1000
ingress_service_accounts = ["serviceaccount.com"]
ingress_network_tags     = ["network-tag"]
ingress_rules = [
  {
    protocol    = "tcp"
    ports       = ["80", "443"]
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    protocol    = "icmp"
    ports       = []
    cidr_blocks = ["10.0.0.0/24"]
  }
]

egress_name             = "new-egress"
egress_priority         = 1000
egress_service_accounts = ["260805399744-compute@developer.gserviceaccount.com"]
egress_network_tags     = ["network-tag"]
egress_rules = [
  {
    protocol           = "tcp"
    ports              = ["53"]
    destination_ranges = ["8.8.8.8/32"]
  },
  {
    protocol           = "udp"
    ports              = ["53"]
    destination_ranges = ["8.8.4.4/32"]
  }
]
