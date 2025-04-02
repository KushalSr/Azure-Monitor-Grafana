variable "resource_group_name" {}
variable "location" {}
variable "monitor_workspace_name" {}
variable "grafana_name" {}
variable "subnet_id" {
  description = "ID of the subnet for private endpoint"
  type        = string
  default     = null  

}
variable "private_endpoint_name" {
  description = "Name of the private endpoint"
  type        = string
  default     = null 

}

