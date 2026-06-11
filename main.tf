resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Project     = "Project2"
    Environment = "production"
    StudentName = var.student_name
  }
}

resource "azurerm_container_group" "aci" {
  name                = var.container_group_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = var.dns_name_label
  os_type             = "Linux"
  restart_policy      = "Always"

  container {
    name   = "cloudscale-dashboard"
    image  = var.docker_image
    cpu    = "1"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = {
    Project     = "Project2"
    Environment = "production"
    StudentName = var.student_name
  }
}