variable "network" {
  description = "VPC network where the rules will be applied"
  type        = string
}

variable "ingress_name" {
  description = "Base name for the ingress firewall rule"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules with ports and source CIDRs"
  type = list(object({
    name          = string
    priority      = number
    protocol      = string
    ports         = list(string)
    source_ranges = list(string)
  }))
}

variable "ingress_service_accounts" {
  type    = list(string)
  default = []
}

variable "ingress_network_tags" {
  type    = list(string)
  default = []
}

variable "egress_name" {
  description = "Base name for the egress firewall rule"
  type        = string
}

variable "egress_rules" {
  description = "List of egress rules with ports and source CIDRs"
  type = list(object({
    name               = string
    priority           = number
    protocol           = string
    ports              = list(string)
    destination_ranges = list(string)
  }))
}

variable "egress_service_accounts" {
  type    = list(string)
  default = []
}

variable "egress_network_tags" {
  type    = list(string)
  default = []
}

variable "default_ingress_source_ranges" {
  description = "Default source CIDR blocks for ingress rules if not provided in rule"
  type        = list(string)
  default     = []
}

variable "default_egress_destination_ranges" {
  description = "Default destination CIDR blocks for egress rules if not provided in rule"
  type        = list(string)
  default     = []
}