module "resource_group_data" {
  source = "../Layers/L9_Commons"
}

module "resource_virtual_network" {
  source = "../Layers/L2_virtual_network"
  recover_resource_location = module.resource_group_data.location
  recover_resource_name = module.resource_group_data.name
}

module "resource_subnet" {
  source = "../Layers/L3_subnet"
  recover_resource_name = module.resource_group_data.name
  virtual_network_name = module.resource_virtual_network.name
}

module "resource_public_ip" {
  source = "../Layers/L4_public_ip"
  recover_resource_location = module.resource_group_data.location
  recover_resource_name = module.resource_group_data.name
}

module "resource_network_security_group" {
  source = "../Layers/L5_network_security_group"
  recover_resource_location = module.resource_group_data.location
  recover_resource_name = module.resource_group_data.name
}

module "resource_network_interface" {
  source = "../Layers/L6_network_interface"
  recover_resource_location = module.resource_group_data.location
  recover_resource_name = module.resource_group_data.name
  subnet_id = module.resource_subnet.id
  public_ip_id = module.resource_public_ip.id
}

module "resource_security_group_association" {
  source = "../Layers/L7_security_group_association"
  network_interface_id = module.resource_network_interface.id
  security_group_id = module.resource_network_security_group.id
}

module "resource_virtual_machine" {
  source = "../Layers/L8_virtual_machine"
  recover_resource_location = module.resource_group_data.location
  recover_resource_name = module.resource_group_data.name
  network_interface_id = module.resource_network_interface.id
}