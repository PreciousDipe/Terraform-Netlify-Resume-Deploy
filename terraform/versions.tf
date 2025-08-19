terraform {
  cloud {

    organization = "resumechallenge_devops_projects"

    workspaces { 
      name = "netlify-ws" 
    } 
  }
  required_providers {
    netlify = {
      source  = "AegirHealth/netlify"
      version = "~> 0.6"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}