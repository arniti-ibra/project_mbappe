output "resource_group" {
    value = azurerm_resource_group.vm_rg.name
}

output "win_username" {
    value = azurerm_windows_virtual_machine.az_win_vm.admin_username
}

output "public_ip" {
    value = azurerm_public_ip.public_ip.ip_address
}