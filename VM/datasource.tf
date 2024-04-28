data "azurerm_subnet" "DATASUBNET" {
  name                 = "Frontend_subnet"
  virtual_network_name = "virtualnetwork_shyam"
  resource_group_name  = "Shyam"
}