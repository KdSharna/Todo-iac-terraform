output "keys_vault" {
  value = {
    for k, key in azurerm_key_vault.keys_vault : k => {
      name     = key.name
      vault_uri =key.vault_uri
      id       = key.id
    }
  }
}
