locals {
  cristiab_lab_org_connectors = {
    github = {
      bcp_lab_org = {
        enable          = true
        description     = "Connector generated by terraform harness provider"
        connection_type = "Account"
        url             = "https://github.com/Crizstian"
        validation_repo = "harness-as-code"
        org_id          = module.bootstrap_harness.organization[var.cristian_lab_org_projects.organization_name].org_id
        credentials = {
          http = {
            username     = "crizstian"
            token_ref_id = harness_platform_secret_text.harness_secrets["connector_bcp_github_token"].identifier
          }
        }
        api_authentication = {
          token_ref_id = harness_platform_secret_text.harness_secrets["connector_bcp_github_token"].identifier
        }
      }
    }
    docker = {
      bcp-lab = {
        enable      = false
        description = "Connector generated by terraform harness provider"
        tags        = ["local:environment"]
        org_id = ""
        type   = "DockerHub"
        url    = "https://registry.hub.docker.com/v1/"
        credentials = {
          username        = "crizstian"
          password_ref_id = harness_platform_secret_text.harness_secrets["connector_bcp_docker_token"].identifier
        }
      }
    }
  }
}
