resource "random_string" "site_name" {
  length = 4
  lower   = true  
  upper   = false 
  numeric = false 
  special = false 
  
  # Advanced options
  min_lower   = 4    
  min_upper   = 0    
  min_numeric = 0  
  min_special = 0  
}

resource "netlify_deploy_key" "key" {}

# Register Netlify’s public key in GitHub
resource "github_repository_deploy_key" "netlify" {
  repository = "Terraform-Netlify-Deploy"
  title      = "netlify-deploy-key"
  key        = netlify_deploy_key.key.public_key
  read_only  = true # set to false if Netlify ever needs push access
}

# resource "netlify_site" "this" {
#   name = "${var.site_name_prefix}-${random_string.site_name.id}"
#   custom_domain = "${var.subdomain}.${var.domain_name}"

locals {
  site_name = "${var.site_name_prefix}-${random_string.site_name.id}"
}

resource "netlify_site" "this" {
  name          = local.site_name
  custom_domain = "${var.subdomain}.${var.domain_name}"
  
  repo {
    repo_branch   = "main"
    deploy_key_id = "${netlify_deploy_key.key.id}"
    provider      = "github"
    repo_path     = "PreciousDipe/Terraform-Netlify-Resume-Deploy"
  }
  
}


data "aws_route53_zone" "main" {
  name         = var.domain_name
  private_zone = false
}

# Use local value to reference resource
resource "aws_route53_record" "subdomain" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.subdomain}.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = ["${local.site_name}.netlify.app"] 
}





