variable "resource_group_name" {
  description = "The name of the existing Resource Group"
  type        = string
}

variable "monitor_workspace_name" {
  description = "The name of the existing Azure Monitor Workspace"
  type        = string
}

variable "grafana_name" {
  description = "The name of the existing Grafana instance"
  type        = string
}

variable "location" {
  description = "The location of the existing resources"
  type        = string
}

variable "grafana_major_version" {
  description = "The major version of Grafana"
  type        = string
}

variable "api_key_enabled" {
  description = "Whether API key is enabled"
  type        = bool
  default     = false
}

variable "auto_generated_domain_name_label_scope" {
  description = "Scope for auto-generated domain name label"
  type        = string
  default     = "TenantReuse"
}

variable "deterministic_outbound_ip_enabled" {
  description = "Enable deterministic outbound IP"
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled"
  type        = bool
  default     = true
}

variable "sku" {
  description = "The SKU of the Grafana instance"
  type        = string
  default     = "Standard"
}

variable "zone_redundancy_enabled" {
  description = "Whether zone redundancy is enabled"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags for the Grafana instance"
  type        = map(string)
  default     = {}
}

variable "monitor_workspace_id" {
  description = "The ID of the existing Azure Monitor Workspace"
  type        = string
}

variable "identity_type" {
  description = "The type of identity for the Grafana instance"
  type        = string
}

variable "identity_ids" {
  description = "The list of identity IDs (if using UserAssigned identity)"
  type        = list(string)
  default     = []
}

# Optional SMTP Configuration
variable "smtp_enabled" {
  description = "Whether SMTP is enabled"
  type        = bool
  default     = false
}

variable "smtp_host" {
  description = "SMTP host for notifications"
  type        = string
  default     = null
}

variable "smtp_user" {
  description = "SMTP user for notifications"
  type        = string
  default     = null
}

variable "smtp_password" {
  description = "SMTP password for notifications"
  type        = string
  default     = null
}

variable "smtp_start_tls_policy" {
  description = "SMTP STARTTLS policy"
  type        = string
  default     = null
}

variable "smtp_from_address" {
  description = "From address for SMTP notifications"
  type        = string
  default     = null
}

variable "smtp_from_name" {
  description = "From name for SMTP notifications"
  type        = string
  default     = "Azure Managed Grafana Notification"
}

variable "smtp_verification_skip_enabled" {
  description = "Whether to skip SMTP verification"
  type        = bool
  default     = false
}

# Private Networking
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
