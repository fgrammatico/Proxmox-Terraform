terraform {
  required_version = ">= 1.7.3"
  required_providers {
    proxmox = {
      source                = "Telmate/proxmox"
      version               = "2.9.14"
      configuration_aliases = [proxmox.kubernetes]
    }
    ansible = {
      source = "ansible/ansible"
      version = "1.3.0"
    }
  }
}

provider "proxmox" {
  pm_parallel         = 3
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  alias               = "kubernetes"
  pm_tls_insecure     = true
  pm_timeout          = 800
  pm_log_enable       = false
  pm_log_file         = "terraform-plugin-proxmox.log"
  pm_debug            = false
  pm_log_levels = {
    _default    = "debug"
    _capturelog = "./capture.log"
  }
}

terraform {
  backend "s3" {
    bucket         = "hacknet-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "hacknet-terraform-state-lock"
  }
}