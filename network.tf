# Create virtual network
resource "azurerm_virtual_network" "myterraformnetwork" {
  address_space       = var.network_address
  location            = azurerm_resource_group.rg.location
  name                = "${var.resource_group_name}-VirtualNet"
  resource_group_name = azurerm_resource_group.rg.name
}

# Create subnet public
resource "azurerm_subnet" "publicsubnet" {
  address_prefixes     = var.public_subnet_address
  name                 = "${var.resource_group_name}-public"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
}


# Create subnet private
resource "azurerm_subnet" "privatesubnet" {
  address_prefixes     = var.private_subnet_address
  name                 = "${var.resource_group_name}-private"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
  service_endpoints = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

#Create Network Security Group and rule
resource "azurerm_network_security_group" "publicnsg" {
  location            = azurerm_resource_group.rg.location
  name                = "${var.resource_group_name}-publicNSG"
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "SSH"
    priority                   = 300
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.source_address_prefix_public_subnet_nsg_rule_ssh
    destination_address_prefix = "*"
  }
  security_rule {
    access                     = "Allow"
    direction                  = "Inbound"
    name                       = "APP_8080"
    priority                   = 400
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
    security_rule {
    source_address_prefix = "*"
    access    = "Deny"
    direction = "Inbound"
    name      = "Deny_All"
    priority  = 1000
    protocol  = "*"
    source_port_range         = "*"
    destination_port_range     = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "privatensg" {
  location            = azurerm_resource_group.rg.location
  name                = "${var.resource_group_name}-privateNSG"
  resource_group_name = azurerm_resource_group.rg.name
  security_rule {
    source_address_prefix = var.source_address_prefix_private_subnet_nsg_rule_ssh
    access    = "Allow"
    direction = "Inbound"
    name      = "SHH"
    priority  = 300
    protocol  = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    destination_address_prefix = "*"
  }
  security_rule {
    source_address_prefix = var.source_address_prefix_private_subnet_nsg_rule_postgresql
    access    = "Allow"
    direction = "Inbound"
    name      = "postgresql"
    priority  = 400
    protocol  = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432"
    destination_address_prefix = "*"
  }
  security_rule {
    source_address_prefix = "*"
    access    = "Deny"
    direction = "Inbound"
    name      = "Deny_All"
    priority  = 1000
    protocol  = "*"
    source_port_range         = "*"
    destination_port_range     = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "privatensg" {
  network_security_group_id = azurerm_network_security_group.privatensg.id
  subnet_id                 = azurerm_subnet.privatesubnet.id
}

resource "azurerm_subnet_network_security_group_association" "publicnsg" {
  network_security_group_id = azurerm_network_security_group.publicnsg.id
  subnet_id                 = azurerm_subnet.publicsubnet.id
}

#Create public loadbalancer ip
resource "azurerm_public_ip" "loadbalancerip" {
  allocation_method   = "Static"
  location            = azurerm_resource_group.rg.location
  name                = "loadbalancerIp"
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
}


# Create LoadBlancer
resource "azurerm_lb" "applb" {
  location            = azurerm_resource_group.rg.location
  name                = "${var.resource_group_name}-AppLoadBalancer"
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "PublicLBIPAddress"
    public_ip_address_id = azurerm_public_ip.loadbalancerip.id
  }
}

# Create LoadBalancer backend address pool
resource "azurerm_lb_backend_address_pool" "backendaddresspool" {
  loadbalancer_id     = azurerm_lb.applb.id
  name                = "BackEndAddressPool"
}


# Create network interface
resource "azurerm_network_interface" "appnic" {
  location            = azurerm_resource_group.rg.location
  count               = var.number_of_vm
  name                = "${var.resource_group_name}-appNic-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "appNicConfiguration"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.publicsubnet.id
 #   public_ip_address_id          = element(azurerm_public_ip.publicip.*.id,count.index)
  }
}

resource "azurerm_lb_rule" "lbrule" {
  resource_group_name = azurerm_resource_group.rg.name
  backend_port                   = 8080
  frontend_ip_configuration_name = azurerm_lb.applb.frontend_ip_configuration[0].name
  frontend_port                  = 8080
  loadbalancer_id                = azurerm_lb.applb.id
  name                           = "APP_8080"
  protocol                       = "Tcp"
  probe_id = azurerm_lb_probe.lbbtobe.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.backendaddresspool.id]

}

resource "azurerm_lb_probe" "lbbtobe" {
  loadbalancer_id = azurerm_lb.applb.id
  name            = "${var.resource_group_name}-health_probe"
  port            = 8080
  interval_in_seconds = 5
  resource_group_name = azurerm_resource_group.rg.name
}



# connect nics to backend pool
resource "azurerm_network_interface_backend_address_pool_association" "nicbackendpool" {
  count = var.number_of_vm
  backend_address_pool_id = azurerm_lb_backend_address_pool.backendaddresspool.id
  ip_configuration_name   = azurerm_network_interface.appnic[count.index].ip_configuration[0].name
  network_interface_id    = azurerm_network_interface.appnic[count.index].id
}


# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "appnicnsg" {
  count                     = var.number_of_vm
  network_interface_id      = element(azurerm_network_interface.appnic.*.id,count.index)
  network_security_group_id = azurerm_network_security_group.publicnsg.id
}

