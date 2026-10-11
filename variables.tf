variable "cloud_run_service_iam_bindings" {
  description = <<EOT
Map of cloud_run_service_iam_bindings, attributes below
Required:
    - members
    - role
    - service
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    members  = set(string)
    role     = string
    service  = string
    location = optional(string)
    project  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

