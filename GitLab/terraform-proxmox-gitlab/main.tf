# Create VMs from a template

resource "proxmox_vm_qemu" "gitlab-1" {
  
  count = 1
  name = "gitlab-${count.index + 1}"
  target_node = var.proxmox_node
  clone = var.cloudinit_template_name

  # VM Cloud-Init Settings
  os_type = "cloud-init"


  #User Settings
  ciuser = "tsantos"
  cipassword     = "040819"
  agent = 1
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF


   # VM CPU Settings
  cores = 4
  sockets = 1
  cpu = "host"

  # VM Memory Settings
  memory = 4096

  # VM Storage Settings
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  disk {
    slot = 0
    size = "40G"
    type = "scsi"
    storage = "Mirror-Fast"
  }


# VM Network Settings
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
  # (Optional) IP Address and Gateway
  ipconfig0 = "ip=192.168.1.13${count.index + 1}/24,gw=192.168.1.254"
  nameserver = "8.8.8.8"
  

}
















