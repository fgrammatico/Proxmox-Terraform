output "control_plane_ips" {
  description = "IP addresses of the control plane nodes"
  value       = [for i in proxmox_vm_qemu.control_plane : i.ipconfig0]
}

output "worker_nodes_ips" {
  description = "IP addresses of the worker nodes"
  value       = [for i in proxmox_vm_qemu.worker_nodes : i.ipconfig0]
}