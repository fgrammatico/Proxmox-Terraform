variable "pm_api_url" {
  description = "The URL of the Proxmox API"
  type        = string
}

variable "pm_node" {
  description = "The Proxmox node to deploy the cluster on"
  type        = string
}

variable "pm_api_token_secret" {
  description = "api token secret"
  type        = string
}

variable "pm_api_token_id" {
  description = "api token id"
  type        = string
}

variable "control_plane_count" {
  description = "The number of control plane nodes to deploy"
  type        = number
  default     = 1
}

variable "cp_agent" {
  description = "The agent"
  type        = number
  default     = 1
}

variable "cp_clone" {
  description = "The clone"
  type        = string
  default     = "Alma9-Base"
}

variable "cp_full_clone" {
  description = "The full clone"
  type        = bool
  default     = true
}

variable "cp_os_type" {
  description = "The OS type"
  type        = string
  default     = "cloud-init"
}

variable "cp_disk_size" {
  description = "The disk size in GB"
  type        = number
  default     = 200
}

variable "cp_cores" {
  description = "The number of cores"
  type        = number
  default     = 2
}

variable "cp_sockets" {
  description = "The number of sockets"
  type        = string
  default     = "1"
}

variable "cp_cpu" {
  description = "The CPU type"
  type        = string
  default     = "host"
}

variable "cp_memory" {
  description = "The memory size in MB"
  type        = number
  default     = 2048
}

variable "cp_scsihw" {
  description = "The SCSI hardware type"
  type        = string
  default     = "virtio-scsi-single"
}

variable "cp_bootdisk" {
  description = "The boot disk"
  type        = string
  default     = "scsi0"
}

variable "cp_network_model" {
  description = "The network"
  type        = string
  default     = "virtio"
}

variable "cp_network_bridge" {
  description = "The bridge"
  type        = string
  default     = "vmbr0"
}

variable "worker_nodes_count" {
  description = "The number of worker nodes to deploy"
  type        = number
  default     = "2"
}

variable "worker_agent" {
  description = "The agent"
  type        = number
  default     = 1
}

variable "worker_clone" {
  description = "The clone"
  type        = string
  default     = "Alma9-Base"
}

variable "worker_full_clone" {
  description = "The full clone"
  type        = bool
  default     = true
}

variable "worker_os_type" {
  description = "The OS type"
  type        = string
  default     = "cloud-init"
}

variable "worker_cores" {
  description = "The number of cores"
  type        = number
  default     = 2
}

variable "worker_sockets" {
  description = "The number of sockets"
  type        = string
  default     = "1"
}

variable "worker_cpu" {
  description = "The CPU type"
  type        = string
  default     = "host"
}

variable "worker_memory" {
  description = "The memory size in MB"
  type        = number
  default     = 2048
}

variable "worker_scsihw" {
  description = "The SCSI hardware type"
  type        = string
  default     = "virtio-scsi-single"
}

variable "worker_bootdisk" {
  description = "The boot disk"
  type        = string
  default     = "scsi0"
}

variable "worker_network_model" {
  description = "The network"
  type        = string
  default     = "virtio"
}

variable "worker_network_bridge" {
  description = "The bridge"
  type        = string
  default     = "vmbr0"
}

variable "ssh_private_key" {
  description = "The SSH key to use for the nodes"
  type        = string
  default     = "Your SSH Key"
}

variable "ssh_user" {
  description = "The SSH user to use for the nodes"
  type        = string
  default     = "Your SSH User"
}

variable "ssh_key_file" {
  description = "The SSH public key to use for the nodes"
  type        = string
  default     = "Your SSH Public Key"
}