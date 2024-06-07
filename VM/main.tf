resource "proxmox_vm_qemu" "resource-name" {
  name        = "VM-name"
  target_node = "pve"
  #iso         = "ISO file name"

  ### or for a Clone VM operation
  clone = "Debian12-Base"

  ### or for a PXE boot VM operation
  # pxe = true
  # boot = "scsi0;net0"
  # agent = 0
}