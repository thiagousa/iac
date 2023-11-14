output "vm_ips" {
  description = "Virtual machines Ips"  
   value = proxmox_vm_qemu.gitlab-1[*].ipconfig0
}