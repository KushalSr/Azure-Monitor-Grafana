output "grafana_id" {
  value = azurerm_dashboard_grafana.this.id
}

output "monitor_workspace_id" {
  value = azurerm_monitor_workspace.this.id
}
