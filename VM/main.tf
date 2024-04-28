resource "azurerm_public_ip" "PUBLICIP" {
  for_each            = var.myfirstvm
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "NIC" {
  for_each            = var.myfirstvm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/f77f8861-0719-41bd-9b2b-8c1f84927f6a/resourceGroups/Shyam/providers/Microsoft.Network/virtualNetworks/virtualnetwork_shyam/subnets/Frontend_subnet"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.PUBLICIP[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "VM" {
  for_each                        = var.myfirstvm
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.NIC[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}