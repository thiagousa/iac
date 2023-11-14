terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {

    ### URL Proxmox
    pm_api_url = var.proxmox_api_url
    
    ### User
    pm_api_token_id = var.proxmox_api_token_id

    ### Token
    pm_api_token_secret = var.proxmox_api_token_secret

    # To Skip TLS Verification
    pm_tls_insecure = true

}



