/*
Project: Proxmox Terraform IaC
Author:  NyanCod3r
Date:    2021-09-20
Description: This is a simple example of how to use the proxmox provider to create VMs on a Proxmox VE cluster.
*/

resource "proxmox_vm_qemu" "control_plane" {
  count       = var.control_plane_count
  name        = "master-${count.index}.k8s.cluster"
  target_node = var.pm_node
  agent       = var.cp_agent
  clone       = var.cp_clone
  full_clone  = var.cp_full_clone
  os_type     = var.cp_os_type
  cores       = var.cp_cores
  sockets     = var.cp_sockets
  cpu         = var.cp_cpu
  memory      = var.cp_memory
  scsihw      = var.cp_scsihw
  bootdisk    = var.cp_bootdisk

  network {
    model  = var.cp_network_model
    bridge = var.cp_network_bridge
  }
  ipconfig0 = replace(var.master_ipconfig, "192.168.5.100", "192.168.5.${100 + count.index}")
  sshkeys   = file("${var.ssh_key_file}")
}

resource "proxmox_vm_qemu" "worker_nodes" {
  count       = var.worker_nodes_count
  name        = "worker-${count.index}.k8s.cluster"
  target_node = var.pm_node
  agent       = var.worker_agent
  clone       = var.worker_clone
  full_clone  = var.worker_full_clone
  os_type     = var.worker_os_type
  cores       = var.worker_cores
  sockets     = var.worker_sockets
  cpu         = var.worker_cpu
  memory      = var.worker_memory
  scsihw      = var.worker_scsihw
  bootdisk    = var.worker_bootdisk

  network {
    model  = var.worker_network_model
    bridge = var.worker_network_bridge
  }
  ipconfig0 = replace(var.master_ipconfig, "192.168.5.100", "192.168.5.${200 + count.index}")
  sshkeys   = file("${var.ssh_key_file}")
}