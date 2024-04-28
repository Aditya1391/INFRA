subnet = {

subnet1 = {

  name                 = "Frontend_subnet"
  resource_group_name  = "Shyam"
  virtual_network_name = "virtualnetwork_shyam"
  address_prefixes     = ["10.0.1.0/24"]
}

subnet2 = {

  name                 = "Backend_subnet"
  resource_group_name  = "Shyam"
  virtual_network_name = "virtualnetwork_shyam"
  address_prefixes     = ["10.0.2.0/24"]

}

subnet3 = {

  name                 = "Azure_Bastion_subnet"
  resource_group_name  = "Shyam"
  virtual_network_name = "virtualnetwork_shyam"
  address_prefixes     = ["10.0.3.0/24"]
}
}