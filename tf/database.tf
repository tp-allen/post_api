resource "azurerm_cosmosdb_account" "cosmos_account" {
  name                = "cosmos-${local.resource_prefix}-001"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = azurerm_resource_group.rg.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "database" {
  name                = "cosmosdb-${local.resource_prefix}-001"
  resource_group_name = azurerm_cosmosdb_account.cosmos_account.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_account.name
  throughput          = 400
}

resource "azurerm_cosmosdb_sql_container" "container" {
  name                  = "${local.resource_prefix}-001"
  resource_group_name   = azurerm_cosmosdb_account.cosmos_account.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmos_account.name
  database_name         = azurerm_cosmosdb_sql_database.database.name
}