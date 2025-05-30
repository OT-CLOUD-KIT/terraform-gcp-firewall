variable "network" {
  description = "VPC network where the rules will be applied"
  type        = string
}

variable "ingress_name" {
  description = "Base name for the ingress firewall rule"
  type        = string
}

variable "ingress_priority" {
  description = "Priority of the ingress rule"
  type        = number
  default     = 1000
}

variable "ingress_rules" {
  description = "List of ingress rules with ports and source CIDRs"
  type = list(object({
    protocol    = string
    ports       = list(string)
    cidr_blocks = list(string)
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

variable "egress_priority" {
  description = "Priority of the egress rule"
  type        = number
  default     = 1000
}

variable "egress_rules" {
  description = "List of egress rules with ports and source CIDRs"
  type = list(object({
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
