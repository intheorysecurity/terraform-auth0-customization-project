variable "prompt" {
  type        = string
  description = "(String) The prompt that you are adding partials for. Options are: login-id, login, login-password, signup, signup-id, signup-password."
}

variable "form_content_start" {
  type        = string
  default     = ""
  description = "(String) Content that goes at the start of the form."
}

variable "form_content_end" {
  type        = string
  default     = ""
  description = "(String) Content that goes at the end of the form."
}

variable "form_footer_start" {
  type        = string
  default     = ""
  description = "(String) Footer content for the start of the footer."
}

variable "form_footer_end" {
  type        = string
  default     = ""
  description = "(String) Footer content for the end of the footer."
}

variable "secondary_actions_start" {
  type        = string
  default     = ""
  description = "(String) Actions that go at the start of secondary actions."
}

variable "secondary_actions_end" {
  type        = string
  default     = ""
  description = "(String) Actions that go at the end of secondary actions."
}

variable "isCustomDomainEnable" {
  type = bool
  description = "(Boolean) This flag tells the module that your Auth0 tenant currently have a custom domain enabled."
}