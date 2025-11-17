
output "resource_groups_info" {
  value = module.name_rg.rg_name
}

output "virtual_networks_info" {
  value = module.nw_virtual.virtual_networks
}

output "public_ip_info" {
  value = module.pip_engress.engress_pip
}

output "sql_server_info" {
  value = module.server_sql.sql_server
}
output "sqldb_info" {
  value = module.sqldb.sql_database
}

# output "firewall_info" {
#   value = module.firewall.firewall_pip
# }

output "linux_vm_info" {
  description = "All created Linux VM resources"
  value       = module.vms.linux_vm
  sensitive   = true
}


