```markdown
# Ansible Kubernetes Cluster Setup

This Ansible script automates the process of setting up a Kubernetes cluster with one control plane and two worker nodes on Ubuntu 20.04 virtual machines.

## Prerequisites

Before running the Ansible script, ensure the following prerequisites are met:

1. **Ansible Installation:**
   Install Ansible on the machine where you plan to run the playbook. You can install Ansible using the following command:

   ```bash
   sudo apt update
   sudo apt install ansible
   ```

2. **SSH Access:**
   Ensure that you can SSH into each Ubuntu 20.04 virtual machine from the machine where Ansible is installed. Make sure you have the necessary SSH keys set up.

3. **Inventory File:**
   Create an Ansible inventory file (`inventory.ini`) that lists the IP addresses or hostnames of your control plane and worker nodes. For example:

   ```ini
   [control-plane]
   control-plane-ip

   [workers]
   worker1-ip
   worker2-ip
   ```

## Usage

1. **Clone the Repository:**
   Clone this repository to your local machine:

   ```bash
   git clone https://github.com/your-username/ansible-kubernetes-cluster.git
   cd ansible-kubernetes-cluster
   ```

2. **Edit Variables:**
   Open the `group_vars/all.yml` file and modify the variables according to your environment. Ensure you set the correct values for variables such as `k8s_version`, `ssh_user`, and others.

3. **Run the Ansible Playbook:**
   Execute the Ansible playbook to set up the Kubernetes cluster:

   ```bash
   ansible-playbook -i inventory.ini main.yml
   ```

   This playbook will install Kubernetes on the specified machines, with one control plane and two worker nodes.

4. **Access the Cluster:**
   After the playbook completes, you can access the Kubernetes cluster from the control plane machine. Use the following command to get the join token for the worker nodes:

   ```bash
   kubeadm token create --print-join-command
   ```

   Run the generated join command on each worker node.

5. **Verify Cluster:**
   On the control plane machine, run the following command to check the status of the cluster:

   ```bash
   kubectl get nodes
   ```

   This should display the control plane and worker nodes with a `Ready` status.

## Customization

Feel free to customize the Ansible playbook and variables according to your requirements. You can add additional tasks, modify configurations, or extend the playbook as needed.

```

Remember to replace placeholders like `your-username` and update the inventory file (`inventory.ini`) with the actual IP addresses or hostnames of your virtual machines. Adjust the instructions based on your specific Ansible playbook structure and organization.