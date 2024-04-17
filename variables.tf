//auth0 tenant vars
variable "auth0_client_name" {
  description = "Client Name, used for labeling AWS Cognito DB"
  type        = string
  default     = "sampleClient"
}

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

//auth0 branding vars
variable "logo_url" {
  type    = string
  default = ""
}

variable "primary_color" {
  type    = string
  default = "#0059d6"
}

variable "page_background" {
  type    = string
  default = "#000000"
}

variable "background_image_url" {
  type = string
}

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

variable "enable_custom_domain_record" {
  type    = bool
  default = false
}

variable "dns_providers" {
  type = string
}

variable "custom_domain" {
  type = string
}

//aws vars
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "aws_root_domain" {
  type    = string
  default = "example.local"
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