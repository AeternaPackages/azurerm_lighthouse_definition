# --- azurerm_lighthouse_definition ---
output "lighthouse_definitions_id" {
  description = "Map of id values across all lighthouse_definitions, keyed the same as var.lighthouse_definitions"
  value       = module.lighthouse_definitions.lighthouse_definitions_id
}

output "lighthouse_definitions_authorization" {
  description = "Map of authorization values across all lighthouse_definitions, keyed the same as var.lighthouse_definitions"
  value       = module.lighthouse_definitions.lighthouse_definitions_authorization
}

output "lighthouse_definitions_description" {
  description = "Map of description values across all lighthouse_definitions, keyed the same as var.lighthouse_definitions"
  value       = module.lighthouse_definitions.lighthouse_definitions_description
}

output "lighthouse_definitions_eligible_authorization" {
  description = "Map of eligible_authorization values across all lighthouse_definitions, keyed the same as var.lighthouse_definitions"
  value       = module.lighthouse_definitions.lighthouse_definitions_eligible_authorization
}

output "lighthouse_definitions_lighthouse_definition_id" {
  description = "Map of lighthouse_definition_id values across all lighthouse_definitions, keyed the same as var.lighthouse_definitions"
  value       = module.lighthouse_definitions.lighthouse_definitions_lighthouse_definition_id
}

output "lighthouse_definitions_managing_tenant_id" {
  description = "Map of managing_tenant_id values across all lighthouse_definitions, keyed the same as var.lighthouse_definitions"
  value       = module.lighthouse_definitions.lighthouse_definitions_managing_tenant_id
}

output "lighthouse_definitions_name" {
  description = "Map of name values across all lighthouse_definitions, keyed the same as var.lighthouse_definitions"
  value       = module.lighthouse_definitions.lighthouse_definitions_name
}

output "lighthouse_definitions_plan" {
  description = "Map of plan values across all lighthouse_definitions, keyed the same as var.lighthouse_definitions"
  value       = module.lighthouse_definitions.lighthouse_definitions_plan
}

output "lighthouse_definitions_scope" {
  description = "Map of scope values across all lighthouse_definitions, keyed the same as var.lighthouse_definitions"
  value       = module.lighthouse_definitions.lighthouse_definitions_scope
}

# --- azurerm_lighthouse_assignment ---
output "lighthouse_assignments_id" {
  description = "Map of id values across all lighthouse_assignments, keyed the same as var.lighthouse_assignments"
  value       = module.lighthouse_assignments.lighthouse_assignments_id
}

output "lighthouse_assignments_lighthouse_definition_id" {
  description = "Map of lighthouse_definition_id values across all lighthouse_assignments, keyed the same as var.lighthouse_assignments"
  value       = module.lighthouse_assignments.lighthouse_assignments_lighthouse_definition_id
}

output "lighthouse_assignments_name" {
  description = "Map of name values across all lighthouse_assignments, keyed the same as var.lighthouse_assignments"
  value       = module.lighthouse_assignments.lighthouse_assignments_name
}

output "lighthouse_assignments_scope" {
  description = "Map of scope values across all lighthouse_assignments, keyed the same as var.lighthouse_assignments"
  value       = module.lighthouse_assignments.lighthouse_assignments_scope
}


