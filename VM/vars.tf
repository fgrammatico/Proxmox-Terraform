variable "ssh_key" {
  default = "KEY"
}

variable "proxmox_api_url" {
    default = "https://IP:8006/api2/json"
}

variable "proxmox_host" {
    default = "NAME"
}

variable "template_name" {
    default = "OS"
}

variable "proxmox_api_token_secret" {
    default = "SECRET"
}

variable "proxmox_api_token_id" {
    default = "TOKEN"
}

variable "vmid" {
	default     = 300
	description = "Starting ID for the CTs"
}

variable "hostnames" {
  description = "Containers to be created"
  type        = list(string)
  default     = ["prod-ct"]
}

variable "rootfs_size" {
	description = "Root filesystem size in GB"
	default = "2G"
}

variable "ips" {
    description = "IPs of the containers, respective to the hostname order"
    type        = list(string)
	default     = ["IP"]
}

variable "user" {
	default     = "root"
	description = "Ansible user used to provision the container"
}