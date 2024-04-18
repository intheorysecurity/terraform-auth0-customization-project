//************************************
//  Auth0 Tenant Variables Section
//************************************
variable "auth0_domain" {
  description = "Auth0 Domain"
  type        = string
  default     = "poc.us.auth0.com"
}

variable "auth0_clientID" {
  description = "Auth0 Application Client ID"
  type        = string
  default     = "clientID"
}

variable "auth0_client_secret" {
  description = "Auth0 Application Client Secret"
  type        = string
  default     = "clientSecret"
}

variable "auth0_debug" {
  type    = bool
  default = false
}

//************************************
//  Auth0 Prompts Variables Section
//************************************
variable "universal_login_experience" {
  type        = string
  default     = "new"
  description = "(String) Which login experience to use. Options include classic and new."
}

variable "identifier_first" {
  type        = bool
  default     = false
  description = "(Boolean) Indicates whether the identifier first is used when using the new Universal Login experience."
}

variable "webauthn_platform_first_factor" {
  type        = bool
  default     = true
  description = "Determines if the login screen uses identifier and biometrics first. Default is set to true"
}

//************************************
//  Auth0 Branding Variables Section
//************************************
variable "logo_url" {
  type    = string
  default = ""
}

variable "primary_color" {
  type    = string
  default = "#0059d6"
}

variable "page_background_color" {
  type    = string
  default = "#000000"
}

variable "background_image_url" {
  type = string
}

//************************************
//  Nested Schema for borders
//************************************
variable "button_border_radius" {
  type    = number
  default = 3.0
}

variable "button_border_weight" {
  type    = number
  default = 1.0
}

variable "buttons_style" {
  type    = string
  default = "rounded"
}

variable "input_border_radius" {
  type    = number
  default = 3.0
}

variable "input_border_weight" {
  type    = number
  default = 1.0
}

variable "inputs_style" {
  type    = string
  default = "rounded"
}

variable "show_widget_shadow" {
  type    = bool
  default = true
}

variable "widget_border_weight" {
  type    = number
  default = 0.0
}

variable "widget_corner_radius" {
  type    = number
  default = 5.0
}

//************************************
//  Nested Schema for colors
//************************************
variable "body_text" {
  type    = string
  default = "#1e212a"
}

variable "error" {
  type    = string
  default = "#d03c38"
}

//************************************
//  Auth0 Prompts Variables Section
//************************************
variable "enable_signup_prompt" {
  type    = bool
  default = true
}

variable "enable_signup_id_prompt" {
  type    = bool
  default = false
}

variable "enable_signup_password_prompt" {
  type    = bool
  default = false
}

variable "enable_login_prompt" {
  type    = bool
  default = false
}

variable "enable_login_id_prompt" {
  type    = bool
  default = false
}

variable "enable_login_password_prompt" {
  type    = bool
  default = false
}

//************************************
//  AWS Environment Variables Section
//************************************
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS Account Access Key"
  type        = string
  default     = "my-access-key"
}

variable "aws_secret_key" {
  description = "AWS Account Secret Key"
  type        = string
  default     = "my-secret-key"
}

variable "aws_account_number" {
  description = "AWS Account Number"
  type        = string
  default     = "1234567890"
}

//************************************
//  Custom Domain Varibles Section
//************************************
variable "enable_custom_domain_record" {
  type    = bool
  default = false
}

variable "dns_provider" {
  type        = string
  description = "Your Domain Name System(DNS) serice. Currently supported DNS providers: AWS"
  default     = "aws"
}

variable "custom_domain" {
  type = string
}

variable "root_domain" {
  type = string
}