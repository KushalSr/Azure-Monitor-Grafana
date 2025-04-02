# New Resource Group
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name # This is for creating new RG
  location = var.location
}

# For Existing Resource Group
# data "azurerm_resource_group" "this" {
#   name = var.resource_group_name  # Fetch existing RG
# }

# This is for create new Azure Monitor Workspace
resource "azurerm_monitor_workspace" "this" {
  name                          = var.monitor_workspace_name
  resource_group_name           = azurerm_resource_group.this.name
  location                      = azurerm_resource_group.this.location
  public_network_access_enabled = false
}

# Fetch existing Monitor Workspace
# data "azurerm_monitor_workspace" "this" {
#   name                = var.monitor_workspace_name
#   resource_group_name = data.azurerm_resource_group.this.name 
# }


resource "azurerm_dashboard_grafana" "this" {
  name                          = var.grafana_name
  resource_group_name           = azurerm_resource_group.this.name
  location                      = azurerm_resource_group.this.location
  grafana_major_version         = 10
  public_network_access_enabled = false

  azure_monitor_workspace_integrations {
    resource_id = azurerm_monitor_workspace.this.id
  }
}

resource "azurerm_private_endpoint" "grafana" {
  count               = var.subnet_id != null ? 1 : 0   
  name                = var.private_endpoint_name
  location            = azurerm_dashboard_grafana.this.location
  resource_group_name = azurerm_dashboard_grafana.this.resource_group_name
  subnet_id           = var.subnet_id  # Ensure this is passed via tfvars

  private_service_connection {
    name                           = "grafana-private-connection"
    private_connection_resource_id = azurerm_dashboard_grafana.this.id
    is_manual_connection           = false
    subresource_names              = ["grafana"]
  }
}

