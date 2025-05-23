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
  source = "./module"

  network                  = var.network
  ingress_name             = var.ingress_name
  ingress_priority         = var.ingress_priority
  ingress_source_cidrs     = var.ingress_source_cidrs
  ingress_service_accounts = var.ingress_service_accounts
  ingress_network_tags     = var.ingress_network_tags

  egress_name             = var.egress_name
  egress_priority         = var.egress_priority
  egress_source_cidrs     = var.egress_source_cidrs
  egress_service_accounts = var.egress_service_accounts
  egress_network_tags     = var.egress_network_tags
}

# Variable values

project_id               = "nw-opstree-dev-landing-zone"
region                   = "us-central1"
network                  = "new-vpc"
ingress_name             = "new-ingress"
ingress_priority         = 1000
ingress_source_cidrs     = ["0.0.0.0/0", "10.0.0.0/24"]
ingress_service_accounts = ["service_account"]
ingress_network_tags     = ["network-tag"]

egress_name             = "new-egress"
egress_priority         = 1000
egress_source_cidrs     = ["0.0.0.0/0"]
egress_service_accounts = ["service_account"]
egress_network_tags     = ["network-tag"]

```

## Inputs

| Name | Description | Type | Default | Required | 
|------|-------------|:----:|---------|:--------:|
|**project_id**| The ID of the project for which the firewall is to be configured | string | { } | yes| 
|**region**| The Google Cloud region | string | us-central1 | yes | 
|**network**| VPC network where the rules will be applied | string | { } |yes| 
|**ingress_name**| Name of the ingress firewall rule | string | { } | yes| 
|**ingress_priority** | Priority of the ingress rule | number | 1000 | yes|
|**ingress_source_cidrs**| Source CIDR ranges for ingress rule | list(string) | [ ] | yes | 
|**ingress_service_accounts**| List of service accounts for ingress rules| list(string) | [ ] | yes| 
|**ingress_network_tags**| Network tags for ingress rule | list(string) | [ ] | yes| 
|**egress_name** | Name of the egress firewall rule | string | { } | yes|
|**egress_priority**| Priority of the egress rule| number |1000 | yes | 
|**egress_source_cidrs**| Source CIDR ranges for egress rule | list(string) | [ ] | yes|
|**egress_service_accounts**| List of service accounts for egress rule | list(string) | [ ]| yes| 
|**egress_network_tags** | Network tags for egress rule | list(string) | [ ]  | yes|

## Output
| Name | Description |
|------|-------------|
|**ingress_firewall_rule_ids**| IDs of the created ingress firewall rules| 
|**egress_firewall_rule_ids**| IDs of the created egress firewall rules |
|**ingress_firewall_rule_names**| Names of the created ingress firewall rules|
|**egress_firewall_rule_names** | Names of the created egress firewall rules |
                                                                                                                  
