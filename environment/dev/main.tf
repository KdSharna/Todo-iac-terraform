module "name_rg" {
  source = "../../module/azure_resource_group"

  rg_name = var.name_rg
}

module "nw_virtual" {
  depends_on = [module.name_rg]
  source     = "../../module/azure_network"

  virtual_nw = var.nw_virtual
}

module "pip_engress" {
  source     = "../../module/azure_public_ip"
  depends_on = [module.name_rg]

  engress_pip = var.pip_engress
}

module "server_sql" {
  source     = "../../module/azure_sql_server"
  depends_on = [module.name_rg]

  sql_server = var.server_sql
}

module "sqldb" {
  source     = "../../module/azure_sql_database"
  depends_on = [module.server_sql]

  my_sqldb = var.sqldb
}

# module "firewall" {
#   source     = "../../module/azure_firewall"
#   depends_on = [module.name_rg, module.nw_virtual]

#   firewall_pip = var.kd_firewall
# }

module "vms" {
  source     = "../../module/azure_linux_vm"
  depends_on = [module.name_rg, module.nw_virtual, module.pip_engress]

  linux_vms = var.vms
}

module "vault_keys" {
  source     = "../../module/azure_key_vault"
  depends_on = [module.name_rg]

  keys_vault = var.vault_keys
}

# module "lb_azure" {
#   source     = "../../module/azure_lb"
#   depends_on = [module.name_rg, module.pip_engress]

#   azure_lb = var.lb_azure
# }

module "bastion_my" {
  source = "../../module/azure_bastion"

  depends_on = [module.name_rg, module.pip_engress, module.nw_virtual]

  my_bastion = var.bastion_my
}
# module "nsg_my" {
#   source = "../../module/azure_nsg"
# depends_on = [ module.name_rg ]

# my_nsg =  var.nsg_my
# }