terraform {
  required_providers {

    tanzu-mission-control = {
      source  = "vmware/tanzu-mission-control"
      version = "1.4.6"
    }
    }
  }

provider "tanzu-mission-control" {
  # Configuration options
  endpoint            = "westtanzuseamericas.tmc.cloud.vmware.com"            # optionally use TMC_ENDPOINT env var
  vmw_cloud_api_token = var.tmc_token
}