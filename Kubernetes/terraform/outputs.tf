output "control_plane_ips" {
  description = "IP addresses of the control plane nodes"
  value       = module.kubernetes_cluster.control_plane_ips
}

output "worker_nodes_ips" {
  description = "IP addresses of the worker nodes"
  value       = module.kubernetes_cluster.worker_nodes_ips
}