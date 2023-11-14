variable "cloudinit_template_name" {
    type = string 
}

variable "proxmox_node" {
    type = string
}

variable "ssh_key" {
  type = string 
  sensitive = true
}
variable "proxmox_api_url" {
  type = string 
  sensitive = true
}


variable "proxmox_api_token_id" {
  type = string 
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type = string 
  sensitive = true
}

variable "pm_api_url" {
  type = string
}