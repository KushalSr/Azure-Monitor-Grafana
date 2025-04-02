module "grafana" {
  for_each = { for idx, g in var.grafana_instances : idx => g }

  source                 = "./modules/"
  resource_group_name    = each.value.resource_group_name
  location               = each.value.location
  monitor_workspace_name = each.value.monitor_workspace_name
  grafana_name           = each.value.grafana_name
  private_endpoint_name  = each.value.private_endpoint_name
  subnet_id              = each.value.subnet_id

}
