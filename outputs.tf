locals {
    base_path = var.custom_domain_verified ? format("%s", var.base_domain) : format("auth.%s/%s", var.base_domain, var.pingone_environment_id)
    environment_as_endpoint = format("https://%s/as", local.base_path)
    environment_authz_endpoint = format("%s/authorize", local.environment_as_endpoint)
    environment_token_endpoint = format("%s/token", local.environment_as_endpoint)
}

output "postman_application_client_id" {
  description = "The client ID used for the Postman OAuth 2.0 authorization type integration.  As the application is configured to use PKCE, the client secret is not required."
  value       = pingone_application.postman.oidc_options.client_id
}

output "postman_application_authorization_endpoint" {
  description = "The environment's authorization endpoint used for the Postman OAuth 2.0 authorization type integration."
  value       = local.environment_authz_endpoint
}

output "postman_application_token_endpoint" {
  description = "The environment's token endpoint used for the Postman OAuth 2.0 authorization type integration."
  value       = local.environment_token_endpoint
}
