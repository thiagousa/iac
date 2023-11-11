output "vm_ips" {
  description = "Virtual machines Ips"  
   value = proxmox_vm_qemu.k8s-1[*].ipconfig0
}