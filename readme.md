# Infrastructure as Code with Terraform and Ansible for Home Server

This repository contains Infrastructure as Code (IaC) scripts using Terraform and Ansible to manage and configure your Home Server. With this setup, you can define and maintain your server infrastructure in a version-controlled manner.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Folder Structure](#folder-structure)
- [Terraform](#terraform)
  - [Proxmox Provider](#proxmox-provider)
  - [VM Configuration](#vm-configuration)
- [Ansible](#ansible)
  - [Playbooks](#playbooks)
  - [Roles](#roles)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before getting started, ensure you have the following prerequisites installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Folder Structure

The folder structure of this project is organized as follows:

```plaintext
.
├── ansible/
│   ├── roles/
│   ├── playbooks/
│   └── inventories/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── README.md
└── .gitignore
```

- **ansible/roles:** Contains Ansible roles used for configuring different components on the server.
- **ansible/playbooks:** Includes Ansible playbooks to orchestrate the configuration tasks.
- **ansible/inventories:** Holds inventory files to specify the hosts and groups for Ansible.
- **terraform:** Consists of Terraform scripts for defining and managing the infrastructure.

## Terraform

### Proxmox Provider

The Terraform scripts use the Proxmox provider to interact with the Proxmox Virtual Environment (PVE) on your Home Server. Ensure you have a Proxmox server set up with the necessary credentials and API access.

### VM Configuration

Define the virtual machines, networks, and storage configurations in the Terraform scripts. Customize the `main.tf`, `variables.tf`, and `outputs.tf` files according to your requirements.

## Ansible

### Playbooks

Ansible playbooks in the `ansible/playbooks` directory are used to execute tasks on the target VMs. These playbooks call specific roles to configure services and applications.

### Roles

Ansible roles, located in the `ansible/roles` directory, contain modular configurations for different components (e.g., web server, database server). Customize these roles to suit your specific application and server needs.

## Usage

1. Clone this repository to your local machine.

```bash
git clone <repository-url>
cd <repository-directory>
```

2. Customize the Terraform scripts in the `terraform` directory to match your Home Server specifications.

3. Run Terraform commands to initialize, plan, and apply the infrastructure changes.

```bash
terraform init
terraform plan
terraform apply
```

4. Execute Ansible playbooks to configure the VMs.

```bash
cd ansible
ansible-playbook -i inventories/<your-inventory-file> playbooks/<your-playbook-file>.yml
```

## Contributing

Feel free to contribute to this project by submitting issues, feature requests, or pull requests. Your feedback and contributions are highly appreciated.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code for your own projects.