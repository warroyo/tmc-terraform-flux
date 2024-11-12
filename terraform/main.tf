resource "tanzu-mission-control_cluster_group" "create_cluster_group" {
  name = "tf-gitops"
  meta {
    description = "Create cluster group through terraform with flux"
    labels = {
      "cloud" : "public",
      "automation" : "terraform"
    }

  }
}
