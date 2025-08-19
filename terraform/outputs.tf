output "netlify_site_url" {
  description = "The deployed Netlify site URL"
  value       = "https://${local.site_name}.netlify.app"
}

output "custom_domain_url" {
  description = "Your custom domain URL"
  value       = "https://${var.subdomain}.${var.domain_name}"
}

output "site_name" {
  description = "The site name used"
  value       = local.site_name
}