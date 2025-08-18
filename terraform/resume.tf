resource "random_string" "site_name" {
  length = 4
  lower  = true
}

resource "netlify_deploy_key" "key" {}

# Register Netlify’s public key in GitHub
resource "github_repository_deploy_key" "netlify" {
  repository = "Terraform-Netlify-Deploy"
  title      = "netlify-deploy-key"
  key        = netlify_deploy_key.key.public_key
  read_only  = true # set to false if Netlify ever needs push access
}

resource "netlify_site" "this" {
  name = "${var.site_name_prefix}-${random_string.site_name.id}"
  
  repo {
    repo_branch   = "main"
    deploy_key_id = "${netlify_deploy_key.key.id}"
    provider      = "github"
    repo_path     = "PreciousDipe/Terraform-Netlify-Resume-Deploy"

  }
  
}
