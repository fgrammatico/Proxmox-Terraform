# On-premises Kubernetes deployment
## Overview
This repository contains a reference implementation of bootstrapping and installation
of a Kubernetes cluster in [ProxMox](https://www.proxmox.com/en/). The provided tooling can be used both as a basis
for personal projects and for educational purposes.

The goal of the project is to provide tooling for reproducible deployment of a fully
functional Kubernetes cluster for on-premises.

Software used:
* `Ansible` for deployment automation
* `kubeadm` for Kubernetes cluster bootstrapping
* `containerd` container runtime
* `Calico` for pod networking
* `Kubespray` to standardize kubernetes deployments
* `Terraform` for IaC
* `Pip or Pipx` for dependencies

## Pre-requisites
* cluster machines/VMs should be provisioned and accessible over SSH
* it is recommended to use AlmaLinux 9.3 as cluster OS
* the current user should have superuser privileges on the cluster nodes
* Ansible installed locally
* Firewall must have Kubernetes [ports open](https://kubernetes.io/docs/reference/networking/ports-and-protocols/)

## Step 1: Provision Infrastructure with Terraform

Run your Terraform script to create the infrastructure:
#### Terraform.tfvars example:
```
# terraform-provider-proxmox example configuration

pm_api_url = "https://IP:PORT/api2/json"

pm_api_token_secret = "SECRET"

pm_api_token_id = "terraform-prov@pve!mytoken"

pm_node = "pve"

ssh_user = "USER"

ssh_private_key = "KEY"

ssh_key_file = "KEY.PUB"

worker_nodes_count = WORKERS

control_plane_count = MASTER
```
#### Run commands:
```sh
terraform init
terraform apply
```
### Step 2: Install Kubespray

Clone the Kubespray repository:
git clone https://github.com/kubernetes-sigs/kubespray.git

```
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
pip install -r requirements.txt
```
## Step 3: Prepare the Inventory File

Generate the Ansible inventory file based on the output from Terraform. Kubespray provides a script to help with this.
```
cp -rfp inventory/sample inventory/mycluster
```
Update the inventory/mycluster/inventory.ini file with the IP addresses of your master and worker nodes. Here’s an example structure:
```
[all]
master ansible_host=<MASTER_IP> ip=<MASTER_IP>
worker1 ansible_host=<WORKER1_IP> ip=<WORKER1_IP>
worker2 ansible_host=<WORKER2_IP> ip=<WORKER2_IP>

[kube_control_plane]
master

[kube_node]
worker1
worker2

[etcd]
master

[k8s_cluster:children]
kube_control_plane
kube_node
```
## Step 4: Configure Kubespray

Review and modify any necessary configuration settings in inventory/mycluster/group_vars. Common configurations include:
```
    Cluster DNS domain:
        group_vars/k8s_cluster/k8s-cluster.yml: Set kube_network_plugin (e.g., calico, flannel).
```
## Step 5: Deploy Kubernetes

Run the Kubespray playbook to deploy Kubernetes:
```
ansible-playbook -i inventory/mycluster/inventory.ini --become --become-user=root cluster.yml

```
## Step 6: Access Your Kubernetes Cluster

After deployment, configure your local kubectl to access the new cluster. Copy the admin configuration file from the master node:

scp root@<MASTER_IP>:/etc/kubernetes/admin.conf ~/.kube/config
Adjust the file permissions:
```
    chmod 600 ~/.kube/config
```
Verify access to the cluster:
```
    kubectl get nodes
```
## Troubleshooting Tips

* SSH Access: Ensure your local machine can SSH into the Proxmox VMs without password prompts. This can be set up using SSH keys.
* Network Configuration: Ensure the network configuration (e.g., IP addresses, gateways) in Proxmox and within the VMs is correct and they can communicate with each other.
* Firewall: Check if any firewalls (either on the host or within the VMs) are not blocking necessary ports for Kubernetes.

Consider running [sonobuoy](https://sonobuoy.io/) conformance test to validate the cluster configuration and health.