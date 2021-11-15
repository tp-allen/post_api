resource azurerm_resource_group resource_group {
  name     = "rg-${local.resource_prefix}-001"
  location = var.location
}

resource "azurerm_container_registry" "registry" {
  name                = "cr${local.resource_prefix_no_hyphen}001"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
  network_rule_set    = []
  tags                = local.standard_tags

}
