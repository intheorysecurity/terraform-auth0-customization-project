//Enable Custom domain in Auth0 Tenant
resource "auth0_custom_domain" "intheory_custom_domain" {
  count  = var.enable_custom_domain_record ? 1 : 0
  domain = var.custom_domain
  type   = "auth0_managed_certs"
}

//Grab AWS DNS zone info
data "aws_route53_zone" "primary" {
  count        = var.dns_providers == "aws" ? 1 : 0
  name         = var.aws_root_domain
  private_zone = false
}

//Create custom DNS record in AWS Route53
resource "aws_route53_record" "custom" {
  count   = var.dns_providers == "aws" && var.enable_custom_domain_record ? 1 : 0
  zone_id = data.aws_route53_zone.primary[0].zone_id
  name    = var.custom_domain
  type    = auth0_custom_domain.intheory_custom_domain[0].verification[0].methods[0].name
  ttl     = 60
  records = ["${auth0_custom_domain.intheory_custom_domain[0].verification[0].methods[0].record}"]
}

//Grab custom domain verification object
resource "auth0_custom_domain_verification" "custom_domain_verification" {
  depends_on       = [aws_route53_record.custom]
  custom_domain_id = auth0_custom_domain.intheory_custom_domain[0].id
}

resource "auth0_prompt" "my_prompt" {
  universal_login_experience     = "new"
  identifier_first               = false
  webauthn_platform_first_factor = true
}

resource "auth0_branding" "tenant_brand" {
  logo_url = var.logo_url

  colors {
    primary         = var.primary_color
    page_background = var.page_background
  }

  universal_login {
    body = templatefile("${path.module}/src/page_template/default_login.html", { background-image = var.background_image_url })
  }

  depends_on = [auth0_custom_domain_verification.custom_domain_verification]
}

resource "auth0_branding_theme" "tenant_brand_theme" {
  borders {}
  fonts {
    body_text {}
    buttons_text {}
    input_labels {}
    links {}
    title {}
    subtitle {}
  }
  colors {}

  page_background {
    background_color     = var.page_background
    background_image_url = var.background_image_url
  }
  widget {
    logo_url = var.logo_url
  }
}


//Create custom login prompt 
resource "auth0_prompt_partials" "login_prompt_partials" {
  count  = var.enable_login_prompt ? 1 : 0
  prompt = "login"

  # form_content_start      = "<div>Updated Form Content Start</div>"
  # form_content_end        = "<div>Updated Form Content End</div>"
  # form_footer_start       = "<div>Updated Footer Start</div>"
  form_footer_end = file("${path.module}/src/sample_prompts/login_prompt/form_footer_end.html")
  # secondary_actions_start = "<div>Updated Secondary Actions Start</div>"
  # secondary_actions_end = "<div>Update Secondary Actions End</div>"

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]

  lifecycle {
    precondition {
      condition     = var.enable_custom_domain_record
      error_message = "Custom domain record must be enabled"
    }
  }
}

resource "auth0_prompt_partials" "login_id_prompt_partials" {
  count  = var.enable_login_id_prompt ? 1 : 0
  prompt = "login-id"

  # form_content_start      = "<div>Updated Form Content Start</div>"
  form_content_end = file("${path.module}/src/sample_prompts/login_id_prompt/form_content_end.html")
  # form_footer_start       = "<div>Updated Footer Start</div>"
  # form_footer_end         = "<div>Updated Footer End</div>"
  # secondary_actions_start = "<div>Updated Secondary Actions Start</div>"
  # secondary_actions_end   = "<div>Updated Secondary Actions End</div>"

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]

  lifecycle {
    precondition {
      condition     = var.enable_custom_domain_record
      error_message = "Custom domain record must be enabled"
    }
  }
}

resource "auth0_prompt_partials" "login_password_prompt_partials" {
  count  = var.enable_login_password_prompt ? 1 : 0
  prompt = "login-password"

  # form_content_start      = "<div>Updated Form Content Start</div>"
  form_content_end = file("${path.module}/src/sample_prompts/login_password_prompt/form_content_end.html")
  # form_footer_start       = "<div>Updated Footer Start</div>"
  # form_footer_end         = "<div>Updated Footer End</div>"
  # secondary_actions_start = "<div>Updated Secondary Actions Start</div>"
  # secondary_actions_end   = "<div>Updated Secondary Actions End</div>"

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]

  lifecycle {
    precondition {
      condition     = var.enable_custom_domain_record
      error_message = "Custom domain record must be enabled"
    }
  }
}

//Create custom Sign Up Prompt
resource "auth0_prompt_partials" "signup_prompt_partials" {
  count  = var.enable_signup_prompt ? 1 : 0
  prompt = "signup"

  # form_content_start      = "<div>Updated Form Content Start</div>"
  form_content_end = file("${path.module}/src/sample_prompts/signup_prompt/form_content_end.html")
  # form_footer_start       = "<div>Updated Footer Start</div>"
  # form_footer_end         = "<div>Updated Footer End</div>"
  # secondary_actions_start = "<div>Updated Secondary Actions Start</div>"
  # secondary_actions_end   = "<div>Updated Secondary Actions End</div>"

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]

  lifecycle {
    precondition {
      condition     = var.enable_custom_domain_record
      error_message = "Custom Domain record must be enabled"
    }
  }
}

//Create custom Sign Up Prompt
resource "auth0_prompt_partials" "signup_id_prompt_partials" {
  count  = var.enable_signup_id_prompt ? 1 : 0
  prompt = "signup-id"

  # form_content_start      = "<div>Updated Form Content Start</div>"
  form_content_end = file("${path.module}/src/sample_prompts/signup_id_prompt/form_content_end.html")
  # form_footer_start       = "<div>Updated Footer Start</div>"
  # form_footer_end         = "<div>Updated Footer End</div>"
  # secondary_actions_start = "<div>Updated Secondary Actions Start</div>"
  # secondary_actions_end   = "<div>Updated Secondary Actions End</div>"

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]

  lifecycle {
    precondition {
      condition     = var.enable_custom_domain_record
      error_message = "Custom Domain record must be enabled"
    }
  }
}

//Create custom Sign Up Prompt
resource "auth0_prompt_partials" "signup_password_prompt_partials" {
  count  = var.enable_signup_password_prompt ? 1 : 0
  prompt = "signup-password"

  # form_content_start      = "<div>Updated Form Content Start</div>"
  form_content_end = file("${path.module}/src/sample_prompts/signup_password_prompt/form_content_end.html")
  # form_footer_start       = "<div>Updated Footer Start</div>"
  # form_footer_end         = "<div>Updated Footer End</div>"
  # secondary_actions_start = "<div>Updated Secondary Actions Start</div>"
  # secondary_actions_end   = "<div>Updated Secondary Actions End</div>"

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]

  lifecycle {
    precondition {
      condition     = var.enable_custom_domain_record
      error_message = "Custom Domain record must be enabled"
    }
  }
}