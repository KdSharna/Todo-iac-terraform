
output "linux_vm" {
  description = "All created Linux VM resources"
  value       = azurerm_linux_virtual_machine.linux_vms
}
