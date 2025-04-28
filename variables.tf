variable "pingone_environment_id" {
  description = "The environment ID for the PingOne environment to configure"
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.pingone_environment_id))
    error_message = "The PingOne environment ID must be a valid PingOne resource ID (UUID format)."
  }
}

variable "application_name" {
  type    = string
  default = "Postman"
}

variable "application_description" {
  type    = string
  default = "Client for Postman to access the PingOne API using Postman's OAuth 2.0 Authorization type."
}

variable "application_group_access_ids" {
  type = set(string)
}

variable "base_domain" {
  type = string
}

variable "custom_domain_verified" {
  type = bool
  default = false
}

variable "custom_domain" {
  type    = string
  default = null
}

variable "enable_by_default" {
  type    = bool
  default = true
}

variable "ignore_enabled_state" {
  type    = bool
  default = false
}