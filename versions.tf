terraform {
  required_version = ">= 1.4.0, < 2.0.0"

  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = ">= 1.4.0, < 2.0.0"
    }
  }
}
