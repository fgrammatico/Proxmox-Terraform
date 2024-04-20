variable "ssh_key" {
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBmafSfm/s+W9JZRN+FkcYhR54Hx4DD6Z/uJWfFuJVf5 MyPrivKey"
}

variable "proxmox_api_url" {
    default = "https://192.168.5.157:8006/api2/json"
}

variable "proxmox_host" {
    default = "Datacenter"
}

variable "template_name" {
    default = "Debian12-Base"
}

variable "proxmox_api_token_secret" {
    default = "68304617-748b-452b-9873-41c4e299f083"
}

variable "proxmox_api_token_id" {
    default = "terraform-prov@pve!mytoken"
}

variable "vmid" {
	default     = 300
	description = "Starting ID for the CTs"
}

variable "hostnames" {
  description = "Containers to be created"
  type        = list(string)
  default     = ["Minecraft"]
}

variable "rootfs_size" {
	description = "Root filesystem size in GB"
	default = "15G"
}

variable "ips" {
    description = "IPs of the containers, respective to the hostname order"
    type        = list(string)
	default     = ["192.168.13.45"]
}

variable "user" {
	default     = "root"
	description = "Ansible user used to provision the container"
}