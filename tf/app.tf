
resource azurerm_app_service_plan app_service_plan {
  name                = "asp-${local.resource_prefix}-001"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  tags                = local.standard_tags
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource azurerm_app_service app_service {
  name                = "app-${local.resource_prefix}-001"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
  tags                = local.standard_tags
  https_only          = false

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.app_insights.instrumentation_key
  }
}

resource azurerm_application_insights app_insights {
  name                = "ais-${local.resource_prefix}-001"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  application_type    = "web"

  tags = local.standard_tags
}