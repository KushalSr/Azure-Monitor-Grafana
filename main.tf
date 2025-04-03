module "grafana" {
  for_each = { for idx, g in var.grafana_instances : idx => g }

  source                      = "./modules/"
  resource_group_name         = each.value.resource_group_name
  location                    = each.value.location
  monitor_workspace_name      = each.value.monitor_workspace_name
  monitor_workspace_id        = each.value.monitor_workspace_id  # Make sure the monitor_workspace_id is included here
  grafana_name                = each.value.grafana_name
  private_endpoint_name       = each.value.private_endpoint_name
  subnet_id                   = each.value.subnet_id
  grafana_major_version       = each.value.grafana_major_version
  smtp_host                   = each.value.smtp_host
  smtp_user                   = each.value.smtp_user
  smtp_password               = each.value.smtp_password
  smtp_start_tls_policy       = each.value.smtp_start_tls_policy
  smtp_from_address           = each.value.smtp_from_address
  identity_type               = each.value.identity_type
  identity_ids                = each.value.identity_ids
  sku                         = each.value.sku
  tags                        = each.value.tags
}
