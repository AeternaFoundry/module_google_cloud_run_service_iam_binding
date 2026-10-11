resource "google_cloud_run_service_iam_binding" "cloud_run_service_iam_bindings" {
  for_each = var.cloud_run_service_iam_bindings

  members  = each.value.members
  role     = each.value.role
  service  = each.value.service
  location = each.value.location
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

