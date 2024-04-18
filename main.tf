//Enable Custom domain in Auth0 Tenant
resource "auth0_custom_domain" "intheory_custom_domain" {
  count  = var.enable_custom_domain_record ? 1 : 0
  domain = var.custom_domain
  type   = "auth0_managed_certs"
}

//Grab AWS DNS zone info
data "aws_route53_zone" "primary" {
  count        = var.dns_providers == "aws" ? 1 : 0
  name         = var.root_domain
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
  universal_login_experience     = var.universal_login_experience
  identifier_first               = var.identifier_first
  webauthn_platform_first_factor = var.webauthn_platform_first_factor
}

//Add Global Tenant Branding
resource "auth0_branding" "tenant_brand" {
  logo_url = var.logo_url

  colors {
    primary         = var.primary_color
    page_background = var.page_background_color
  }

  universal_login {
    body = templatefile("${path.module}/src/page_template/default_login.html", { background-image = var.background_image_url })
  }

  depends_on = [auth0_custom_domain_verification.custom_domain_verification]
}

//Add Branding Theme to Auth0 Tenant
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
    background_color     = var.page_background_color
    background_image_url = var.background_image_url
  }
  widget {
    logo_url = var.logo_url
  }
}

/*
This section contains examples no how to create the 
following partials prompts within your Okta CIC Tenant

- Login Prompt
- Login ID Prompt
- Login Password Prompt
- Signup Prompt
- Signup ID Prompt
- Signup Password Prompt
*/
//Example of a Custom Login Prompt
module "login_prompt_partials" {
  count                = var.enable_login_prompt ? 1 : 0
  source               = "./modules/prompt_partials"
  prompt               = "login"
  isCustomDomainEnable = var.enable_custom_domain_record
  form_footer_end      = file("${path.module}/src/sample_prompts/login_prompt/form_footer_end.html")

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]
}

module "login_id_prompt_partials" {
  count                = var.enable_login_id_prompt ? 1 : 0
  source               = "./modules/prompt_partials"
  prompt               = "login-id"
  isCustomDomainEnable = var.enable_custom_domain_record
  form_content_end     = file("${path.module}/src/sample_prompts/login_id_prompt/form_content_end.html")

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]
}

module "login_password_prompt_partials" {
  count                = var.enable_login_password_prompt ? 1 : 0
  source               = "./modules/prompt_partials"
  prompt               = "login-password"
  isCustomDomainEnable = var.enable_custom_domain_record
  form_content_end     = file("${path.module}/src/sample_prompts/login_password_prompt/form_content_end.html")

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]
}

//Example of a custom Sign Up Prompt
module "signup_prompt_partials" {
  count                = var.enable_signup_prompt ? 1 : 0
  source               = "./modules/prompt_partials"
  prompt               = "signup"
  isCustomDomainEnable = var.enable_custom_domain_record
  form_content_end     = file("${path.module}/src/sample_prompts/signup_prompt/form_content_end.html")

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]
}

module "signup_id_prompt_partials" {
  count                = var.enable_signup_id_prompt ? 1 : 0
  source               = "./modules/prompt_partials"
  prompt               = "signup-id"
  isCustomDomainEnable = var.enable_custom_domain_record
  form_content_end     = file("${path.module}/src/sample_prompts/signup_id_prompt/form_content_end.html")

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]
}

module "signup_password_prompt_partials" {
  count                = var.enable_signup_password_prompt ? 1 : 0
  source               = "./modules/prompt_partials"
  prompt               = "signup-password"
  isCustomDomainEnable = var.enable_custom_domain_record
  form_content_end     = file("${path.module}/src/sample_prompts/signup_password_prompt/form_content_end.html")

  depends_on = [auth0_branding.tenant_brand, auth0_custom_domain_verification.custom_domain_verification]
}