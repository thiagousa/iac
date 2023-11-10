## Project Setup Guide

### Prerequisites

Before proceeding with the installation, ensure that you have the following prerequisites in place:

1. **Proxmox Server**: Ensure you have a Proxmox server set up.

### Resources

Make use of the following resources during the installation process:

1. [Debian Cloud Images](https://cloud.debian.org/images/cloud/): Obtain the Debian cloud image for your deployment.
2. [Terraform Proxmox Provider Documentation](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs): Refer to the Terraform Proxmox Provider documentation for additional information.

### Install libguestfs-tools

Connect to the Proxmox server via SSH and install the required tools:

```bash
ssh root@proxmox-server

sudo apt update -y && sudo apt install libguestfs-tools -y
```

### Download Debian Cloud Image

Download the Debian cloud image using the following command:

```bash
wget https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-arm64.qcow2
```

### Install qemu-guest-agent in the Cloud Image

Install the QEMU guest agent in the downloaded cloud image:

```bash
virt-customize -a debian-11-generic-amd64.qcow2 --install qemu-guest-agent
```

### Create VM Template

Create a virtual machine template with the specified settings:

```bash
qm create 9003 --name "debian-11-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk 9003 debian-11-generic-amd64.qcow2 local-lvm
qm set 9003 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9003-disk-0
qm set 9003 --boot c --bootdisk scsi0
qm set 9003 --ide2 local-lvm:cloudinit
qm set 9003 --serial0 socket --vga serial0
qm set 9003 --agent enabled=1

qm template 9003
```

### Create a Role and User for Terraform

Create a role with the necessary privileges and a user for Terraform:

```bash
# Create Role
pveum role add terraform_role -privs "Datastore.AllocateSpace Datastore.Audit Pool.Allocate Sys.Audit Sys.Console Sys.Modify VM.Allocate VM.Audit VM.Clone VM.Config.CDROM VM.Config.Cloudinit VM.Config.CPU VM.Config.Disk VM.Config.HWType VM.Config.Memory VM.Config.Network VM.Config.Options VM.Migrate VM.Monitor VM.PowerMgmt"

# Create User
pveum user add terraform_user@pve --password secure1234

# Map Role to User
pveum aclmod / -user terraform_user@pve -role terraform_role
```

### Export Proxmox API Credentials

Export Proxmox API credentials to grant access to the Terraform client:

```bash
export PM_USER="terraform_user@pve"
export PM_PASS="secure1234"
```

### Initialize Project and Deploy Infrastructure

Initialize the Terraform project and deploy the infrastructure:

```bash
terraform init
terraform plan
terraform apply
```

Ensure to replace `proxmox-server` with the actual address of your Proxmox server. This guide assumes you have a basic understanding of Proxmox and Terraform. Refer to respective documentation for more details.