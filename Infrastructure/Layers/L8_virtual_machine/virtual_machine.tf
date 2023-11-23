data "azurerm_resource_group" "example" {
  name     = "DevOps-Resources"
}

resource "azurerm_virtual_machine" "example" {
  name                  = "build-agent-vm"
  location              = data.azurerm_resource_group.example.location
  resource_group_name   = data.azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = "Standard_B2s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "build-agent-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "StandardSSD_LRS"
    disk_size_gb = "128"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "adminuser"
    admin_password = ""
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}