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

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true
  default     = "" 
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
  default     = "" 
}

variable "domain_name" {
  description = "The main domain name"
  type        = string
  default     = "preciousdipe.com.ng"
}

variable "subdomain" {
  description = "Subdomain for the Netlify site"
  type        = string
  default     = "netlify"  # Will create netlify.preciousdipe.com.ng
}
