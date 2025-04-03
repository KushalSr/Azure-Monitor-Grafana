
# Data block to reference an existing Resource Group
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

# Data block to reference an existing Azure Monitor Workspace
data "azurerm_monitor_workspace" "this" {
  name                = var.monitor_workspace_name
  resource_group_name = data.azurerm_resource_group.this.name
}

# Grafana Dashboard Resource - using azurerm_dashboard_grafana
resource "azurerm_dashboard_grafana" "this" {
  name                                   = var.grafana_name
  resource_group_name                    = data.azurerm_resource_group.this.name
  location                               = var.location
  grafana_major_version                  = var.grafana_major_version
  api_key_enabled                        = var.api_key_enabled
  auto_generated_domain_name_label_scope = var.auto_generated_domain_name_label_scope
  deterministic_outbound_ip_enabled      = var.deterministic_outbound_ip_enabled
  public_network_access_enabled          = var.public_network_access_enabled
  sku                                    = var.sku
  zone_redundancy_enabled                = var.zone_redundancy_enabled
  tags                                   = var.tags

  azure_monitor_workspace_integrations {
    resource_id = data.azurerm_monitor_workspace.this.id  # Reference to the existing Azure Monitor Workspace ID
  }

  identity {
    type         = var.identity_type
    identity_ids = var.identity_ids
  }

  smtp {
    enabled                   = var.smtp_enabled
    host                      = var.smtp_host
    user                      = var.smtp_user
    password                  = var.smtp_password
    start_tls_policy          = var.smtp_start_tls_policy
    from_address              = var.smtp_from_address
    from_name                 = var.smtp_from_name
    verification_skip_enabled = var.smtp_verification_skip_enabled
  }
}

# Managed resource for the private endpoint
resource "azurerm_private_endpoint" "grafana" {
  count               = var.subnet_id != null ? 1 : 0
  name                = var.private_endpoint_name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "grafana-private-connection"
    private_connection_resource_id = azurerm_dashboard_grafana.this.id  # Reference the Grafana Dashboard resource
    is_manual_connection           = false
    subresource_names              = ["grafana"]
  }
}
