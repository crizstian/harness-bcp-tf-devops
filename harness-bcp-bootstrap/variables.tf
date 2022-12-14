variable "harness_platform_api_key" {
  sensitive = true
}
variable "harness_platform_account_id" {
  sensitive = true
}
variable "harness_connector_bcp_github_token" {
  sensitive = true
}
variable "harness_connector_bcp_docker_token" {
  sensitive = true
}
variable "harness_connector_bcp_artifactory_token" {
  sensitive = true
}
variable "harness_template_endpoint" {
  default = "https://app.harness.io/gateway/template/api/templates"
}

locals {
  harness_platform_projects = tomap({
    "cristian-lab-bcp-org" = var.bcp_lab_org_projects
  })
  harness_platform_connectors = merge(
    local.cristiab_lab_org_connectors
  )
  harness_platform_delegates = tomap({
    k8s = merge(local.cristiab_lab_org_delegates.k8s)
  })
  harness_platform_secrets = merge(
    local.bcp_secrets_org
  )

  harness_template_endpoint_account_args = "?accountIdentifier=${var.harness_platform_account_id}&orgIdentifier=${module.bootstrap_harness.organization[var.bcp_lab_org_projects.organization_name].org_id}&storeType=INLINE&comments=terraform-generated"
}
