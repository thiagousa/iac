# output "virtual-machine-ip" {

# description = "Virtual machines Ips"
# value = [for ipconfig0 in resource.proxmox_vm_qemu.k8s-1.ipconfig0 : "${ip}"]

# }