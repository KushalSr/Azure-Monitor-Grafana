variable "grafana_instances" {
  description = "List of Grafana instances to deploy"
  type = map(object({
    resource_group_name    = string
    location               = string
    monitor_workspace_name = string
    grafana_name           = string
    private_endpoint_name  = string
    subnet_id              = string
  }))
  default = {} 
}
