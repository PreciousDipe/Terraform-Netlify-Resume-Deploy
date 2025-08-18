provider "netlify" {
  token = var.netlify_token
}

provider "github" {
  token = var.github_token
  owner = "PreciousDipe"
}

# provider "aws" {
#   region = var.aws_region
# }