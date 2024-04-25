module "infra_data" {
  source       = "git@github.com:ZeitOnline/terraform-modules.git//shared_infra?ref=shared_infra-v0.1.0"
  cluster_name = var.cluster_name
}

locals {
  # tflint-ignore: terraform_unused_declarations
  baseproject_context = {
    gke_cluster = module.infra_data.gke_cluster
    environment = var.environment
    unique_id   = var.unique_id
  }
}
