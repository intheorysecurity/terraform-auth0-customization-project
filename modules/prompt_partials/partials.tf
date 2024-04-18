terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.2.0"
    }
  }
}

data "auth0_custom_domain" "custom_domain" {}

resource "auth0_prompt_partials" "prompt_partial" {
  prompt = var.prompt

  form_content_end        = var.form_content_end
  form_content_start      = var.form_content_start
  form_footer_end         = var.form_footer_end
  form_footer_start       = var.form_footer_start
  secondary_actions_end   = var.secondary_actions_end
  secondary_actions_start = var.secondary_actions_start

  lifecycle {
    precondition {
        condition = var.isCustomDomainEnable || data.auth0_custom_domain.custom_domain.status == "ready"
        error_message = "The CIC (Auth0) Tenant must have an custom domain applied. Please set enable_custom_domain_record to true on the variables.tf file"
    }
  }
}