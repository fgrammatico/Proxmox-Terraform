/*
Project: Proxmox Terraform IaC
Author:  NyanCod3r
Date:    2021-09-20
Description: This is a simple example of how to use the proxmox provider to create VMs on a Proxmox VE cluster.
*/

module "kubernetes_cluster" {
  source              = "./modules/kubernetes_cluster"
  control_plane_count = var.control_plane_count
  cp_clone            = var.cp_clone
  cp_full_clone       = true
  worker_nodes_count  = 2
  worker_clone        = var.worker_clone
  worker_full_clone   = var.worker_full_clone
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_api_url          = var.pm_api_url
  pm_node             = var.pm_node
  ssh_user            = var.ssh_user
  ssh_private_key     = var.ssh_private_key
  ssh_key_file        = var.ssh_key_file
  providers = {
    proxmox = proxmox.kubernetes
  }
}
resource "null_resource" "ansible_playbook" {
  depends_on = [module.kubernetes_cluster]

  provisioner "local-exec" {
    command = "ansible-playbook -i your_inventory_file.yml your_playbook.yml"
  }
}