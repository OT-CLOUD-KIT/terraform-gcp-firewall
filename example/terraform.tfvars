project_id               = "nw-opstree-dev-landing-zone"
region                   = "us-central1"
network                  = "new-vpc"
ingress_name             = "new-ingress"
ingress_priority         = 1000
ingress_source_cidrs     = ["0.0.0.0/0", "10.0.0.0/24"]
ingress_service_accounts = ["service-account-1@project-id.iam.gserviceaccount.com"]
ingress_network_tags     = ["network-tag"]

egress_name             = "new-egress"
egress_priority         = 1000
egress_source_cidrs     = ["0.0.0.0/0"]
egress_service_accounts = ["service-account-1@project-id.iam.gserviceaccount.com"]
egress_network_tags     = ["network-tag"]
