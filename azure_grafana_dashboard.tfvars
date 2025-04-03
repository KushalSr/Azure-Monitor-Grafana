# Grafana
grafana_instances = {
  "instance_1" = {
    resource_group_name    = "Azure-Monitor-Grafana-RG"
    location               = "Central India"
    monitor_workspace_name = "Azure-Logs"
    grafana_name           = "azure-grafana"

    # Networking
    subnet_id              = null  # Set if private endpoint is needed
    private_endpoint_name  = null  # Set if using a private endpoint

    # Identity
    identity_type          = "SystemAssigned"  # Can be "UserAssigned" or "SystemAssigned"
    identity_ids           = []  # Required if using "UserAssigned" identity

    # Configuration
    grafana_major_version  = "10"  # Changed from integer to string
    sku                    = "Standard"  # Can be "Standard" or "Essential"
    public_network_access  = false  # Set to true if Grafana should be accessible over public network
    zone_redundancy        = true   # Enable for high availability across zones

    # SMTP Configuration (Optional)
    smtp_enabled           = false  # Ensures Terraform doesn't expect other SMTP values if not enabled
    smtp_host              = null
    smtp_user              = null
    smtp_password          = null
    smtp_start_tls_policy  = null
    smtp_from_address      = null

    # Tags
    tags = {
      Environment = "Production"
      Owner       = "DevOps Team"
      Project     = "Azure Monitoring"
    }

    # Monitor Workspace ID
    monitor_workspace_id = ""

  }
}
