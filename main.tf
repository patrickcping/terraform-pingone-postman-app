resource "pingone_image" "logo" {
  environment_id = var.pingone_environment_id

  image_file_base64 = filebase64(format("%s/postman-logo.png", path.module))
}

resource "pingone_application" "postman" {
  environment_id = var.pingone_environment_id

  name        = var.application_name
  description = var.application_description
  enabled     = var.enable_by_default

  hidden_from_app_portal = false

  icon = {
    href = pingone_image.logo.uploaded_image.href
    id   = pingone_image.logo.id
  }

  access_control_group_options = {
    groups = var.application_group_access_ids
    type   = "ANY_GROUP"
  }

  access_control_role_type = "ADMIN_USERS_ONLY"

  oidc_options = {
    type = "WORKER"

    grant_types = [
      "AUTHORIZATION_CODE",
      "REFRESH_TOKEN",
    ]
    response_types = [
      "CODE",
    ]

    pkce_enforcement           = "S256_REQUIRED"
    token_endpoint_auth_method = "NONE"

    redirect_uris = [
      "https://oauth.pstmn.io/v1/callback",
    ]
    allow_wildcard_in_redirect_uris = false

    refresh_token_duration                      = 2592000
    refresh_token_rolling_duration              = 15552000
    refresh_token_rolling_grace_period_duration = 0
  }

  lifecycle {
    ignore_changes = [
       enabled,
    ]
  }
}
