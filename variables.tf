variable "grafana_instances" {
  description = "List of Grafana instances to deploy"
  type = map(object({
    resource_group_name    = string
    location               = string
    monitor_workspace_name = string
    grafana_name           = string
    grafana_major_version  = optional(string, "10")  # Default version 10

    # Networking
    private_endpoint_name  = optional(string, null)
    subnet_id              = optional(string, null)

    # Identity
    identity_type          = optional(string, "SystemAssigned")
    identity_ids           = optional(list(string), [])

    # Configuration
    sku                    = optional(string, "Standard")
    public_network_access  = optional(bool, false)
    zone_redundancy        = optional(bool, false)
    monitor_workspace_id   = string  # Required field

    # SMTP Configuration (Optional)
    smtp_enabled           = optional(bool, false)  # Default SMTP disabled
    smtp_host              = optional(string, null)
    smtp_user              = optional(string, null)
    smtp_password          = optional(string, null)
    smtp_start_tls_policy  = optional(string, null)
    smtp_from_address      = optional(string, null)

    # Tags
    tags                   = optional(map(string), {})  # Default empty map
  }))
  default = {}

  validation {
    condition = alltrue([
      for _, g in var.grafana_instances :
      !(g.identity_type == "UserAssigned" && length(g.identity_ids) == 0)
    ])
    error_message = "If identity_type is 'UserAssigned', identity_ids must not be empty."
  }
}
