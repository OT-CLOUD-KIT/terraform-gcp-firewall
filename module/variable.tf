variable "network" {
  description = "VPC network where the rules will be applied"
  type        = string
}

variable "ingress_name" {
  description = "Name of the ingress firewall rule"
  type        = string
}

variable "ingress_priority" {
  description = "Priority of the ingress rule"
  type        = number
  default     = 1000
}

variable "ingress_source_cidrs" {
  description = "Source CIDR ranges for ingress rule"
  type        = list(string)
}

variable "ingress_service_accounts" {
  description = "List of service accounts for ingress rule"
  type        = list(string)
  default     = []
}

variable "ingress_network_tags" {
  description = "Network tags for ingress rule"
  type        = list(string)
  default     = []
}

variable "egress_name" {
  description = "Name of the egress firewall rule"
  type        = string
}

variable "egress_priority" {
  description = "Priority of the egress rule"
  type        = number
  default     = 1000
}

variable "egress_source_cidrs" {
  description = "Source CIDR ranges for egress rule"
  type        = list(string)
}

variable "egress_service_accounts" {
  description = "List of service accounts for egress rule"
  type        = list(string)
  default     = []
}

variable "egress_network_tags" {
  description = "Network tags for egress rule"
  type        = list(string)
  default     = []
}
