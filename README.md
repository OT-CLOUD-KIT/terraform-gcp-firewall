## Terraform GCP Firewall

[![Opstree Solutions][opstree_avatar]][opstree_homepage]<br/>[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

These Terraform resources create dynamic INGRESS and EGRESS firewall rules in GCP based on whether network tags or service accounts are provided. The for_each loop ensures that rules are only created if the corresponding values exist, and assigns appropriate targets with predefined TCP ports (80, 443).

## Architecture

<img width="600" length="800" alt="Terraform" src="https://github.com/user-attachments/assets/22a28392-0bb2-47c9-802e-99ec9a9f7246">

## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_gcp"></a> [gcp](#provider\_gcp) | 5.0.0   |

## Usage

```hcl
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

# Variable values

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

```

## Inputs

| Name | Description | Type | Default | Required | 
|------|-------------|:----:|---------|:--------:|
|**project_id**| The ID of the project for which the firewall is to be configured | string | { } | yes| 
|**region**| The Google Cloud region | string | us-central1 | yes | 
|**network**| VPC network where the rules will be applied | string | { } |yes| 
|**ingress_name**| Name of the ingress firewall rule | string | { } | yes| 
|**default_ingress_source_ranges** | Default source CIDR blocks for ingress rules if not provided in rule | list(string) | [] | yes|
|**ingress_rules**| Rules for ingress rule | list(object()) | [ ] | yes|
|**ingress_service_accounts**| List of service accounts for ingress rules| list(string) | [ ] | yes| 
|**ingress_network_tags**| Network tags for ingress rule | list(string) | [ ] | yes| 
|**egress_name** | Name of the egress firewall rule | string | { } | yes|
|**default_egress_destination_ranges**| Default destination CIDR blocks for egress rules if not provided in rule| list(string) |[] | yes | 
|**egress_rules**| Rules for egress rule | list(object()) | [ ] | yes|
|**egress_service_accounts**| List of service accounts for egress rule | list(string) | [ ]| yes| 
|**egress_network_tags** | Network tags for egress rule | list(string) | [ ]  | yes|

## Output
| Name | Description |
|------|-------------|
|**ingress_firewall_rules**| Names of the created ingress firewall rules|
|**egress_firewall_rules** | Names of the created egress firewall rules |
                                                                                                                  
