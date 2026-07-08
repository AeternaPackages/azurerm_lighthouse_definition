variable "lighthouse_definitions" {
  description = <<EOT
Map of lighthouse_definitions, attributes below
Required:
    - managing_tenant_id
    - name
    - scope
    - authorization (block)
Optional:
    - description
    - lighthouse_definition_id
    - eligible_authorization (block)
    - plan (block)
Nested lighthouse_assignments (azurerm_lighthouse_assignment):
    Required:
        - scope
    Optional:
        - name
EOT

  type = map(object({
    managing_tenant_id       = string
    name                     = string
    scope                    = string
    description              = optional(string)
    lighthouse_definition_id = optional(string)
    authorization = list(object({
      delegated_role_definition_ids = optional(set(string))
      principal_display_name        = optional(string)
      principal_id                  = string
      role_definition_id            = string
    }))
    eligible_authorization = optional(object({
      just_in_time_access_policy = optional(object({
        approver = optional(object({
          principal_display_name = optional(string)
          principal_id           = string
        }))
        maximum_activation_duration = optional(string) # Default: "PT8H"
        multi_factor_auth_provider  = optional(string)
      }))
      principal_display_name = optional(string)
      principal_id           = string
      role_definition_id     = string
    }))
    plan = optional(object({
      name      = string
      product   = string
      publisher = string
      version   = string
    }))
    lighthouse_assignments = optional(map(object({
      scope = string
      name  = optional(string)
    })))
  }))

  validation {
    condition = alltrue(concat(
      [for kk in keys(var.lighthouse_definitions) : !strcontains(kk, "/")],
      flatten([for k0, v0 in var.lighthouse_definitions : [for kk in keys(coalesce(v0.lighthouse_assignments, {})) : !strcontains(kk, "/")]])
    ))
    error_message = "Map keys in this package must not contain '/': it is used internally as a nesting-key separator, so a key containing it can silently collide two different nested entries into one. Rename the offending key(s)."
  }
}
