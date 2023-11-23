resource "azapi_update_resource" "azurerm_cosmosdb_account_update_tls_to_1_2" {
  type        = "Microsoft.DocumentDB/databaseAccounts@2023-03-15"
  resource_id = azurerm_cosmosdb_account.example.id
  body = jsonencode({
    properties = {
      minimalTlsVersion = "Tls12"
    }
  })
  provider = azapi.tlsfix
  #dependencia explicita
  depends_on = [
    azurerm_cosmosdb_sql_container.example
  ]
}