locals {
  lighthouse_definitions = { for k1, v1 in var.lighthouse_definitions : k1 => { authorization = v1.authorization, description = v1.description, eligible_authorization = v1.eligible_authorization, lighthouse_definition_id = v1.lighthouse_definition_id, managing_tenant_id = v1.managing_tenant_id, name = v1.name, plan = v1.plan, scope = v1.scope } }

  lighthouse_assignments = merge([
    for k1, v1 in var.lighthouse_definitions : {
      for k2, v2 in coalesce(v1.lighthouse_assignments, {}) :
      "${k1}/${k2}" => merge(v2, {
        lighthouse_definition_id = module.lighthouse_definitions.lighthouse_definitions_id["${k1}"]
      })
    }
  ]...)
}

module "lighthouse_definitions" {
  source                 = "git::https://github.com/AeternaModules/azurerm_lighthouse_definition.git?ref=v4.80.0"
  lighthouse_definitions = local.lighthouse_definitions
}

module "lighthouse_assignments" {
  source                 = "git::https://github.com/AeternaModules/azurerm_lighthouse_assignment.git?ref=v4.80.0"
  lighthouse_assignments = local.lighthouse_assignments
  depends_on             = [module.lighthouse_definitions]
}

