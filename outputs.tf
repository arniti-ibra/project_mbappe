output "resource_group" {
  value = azurerm_resource_group.vm_rg.name
}

output "win_username" {
  value = azurerm_linux_virtual_machine.az_lin_vm.admin_username
}

output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "private_key_sanity_check" {
  value = tls_private_key.vm_ssh.id
}

output "private_key" {
  value     = tls_private_key.vm_ssh.private_key_pem
  sensitive = true
}

output "public_key" {
  value     = tls_private_key.vm_ssh.public_key_pem
  sensitive = true
}
#terraform output -raw private_key > id_rsa

#To get to the /etc directory for an installed distribution, use the distribution's command line with cd / to access the root directory, 
#then ls to list files or explorer.exe . to view in Windows File Explorer. The directory path should look something like: /etc/wsl.conf.

# using wsl ubuntu on vs code --> arnitibrahimi@DESKTOP-08H16SS:/mnt/c/ce04/project_mbappe$ chmod 400 id_rsa --changes
#ssh -i id_rsa azureuser@<public_ip_address>