variable "netlify_token" {
  description = "Your Netlify personal access token"
  type        = string
  sensitive   = true
}

variable "site_name_prefix" {
  description = "Prefix for the site name"
  type        = string
  default     = "resume"
}

variable "github_token" {
  description = "Your GitHub personal access token"
  type        = string
  sensitive   = true
}
