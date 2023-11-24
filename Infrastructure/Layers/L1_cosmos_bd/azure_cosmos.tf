data "azurerm_resource_group" "recovered_resource_group" {
  name     = "Resources_OXXO_IaC_01"
}

resource "azurerm_cosmosdb_account" "cosmos_account" {
  name                = "cosmos-metrics-terraform-01"
  location            = data.azurerm_resource_group.recovered_resource_group.location
  resource_group_name = data.azurerm_resource_group.recovered_resource_group.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB" # API: Núcleo (SQL)

  enable_automatic_failover = true
  capabilities {
    name = "EnableServerless"
  }

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = data.azurerm_resource_group.recovered_resource_group.location
    failover_priority = 0
  }

  # Método de conectividad: Todas las redes externas
  public_network_access_enabled = true
}

resource "azurerm_cosmosdb_sql_database" "cosmos_database" {
  name                = "KPIS_BD"
  resource_group_name = data.azurerm_resource_group.recovered_resource_group.name
  account_name        = azurerm_cosmosdb_account.cosmos_account.name
}

resource "azurerm_cosmosdb_sql_container" "cosmos_container" {
  name                = "devops.oxxo.metrics"
  resource_group_name = data.azurerm_resource_group.recovered_resource_group.name
  account_name        = azurerm_cosmosdb_account.cosmos_account.name
  database_name       = azurerm_cosmosdb_sql_database.cosmos_account.name

  partition_key_path   = "/partitionKey"
  unique_key {
    paths = ["/Id"]
  }
}