# List of providers present in all ops projects
provider "google" {
  project = "zeitonline-main"
  region  = "europe-west3"
  zone    = "europe-west3-a"
}

provider "google-beta" {
  project = "zeitonline-main"
  region  = "europe-west3"
  zone    = "europe-west3-a"
}

# tflint-ignore: terraform_unused_declarations
data "google_project" "project" {}

data "google_client_config" "this" {}

provider "kubernetes" {
  host                   = "https://${module.infra_data.gke_cluster.endpoint}"
  token                  = data.google_client_config.this.access_token
  cluster_ca_certificate = module.infra_data.gke_cluster.ca_certificate
  ignore_labels = [
    "hnc\\.x-k8s\\.io/included-namespace",
    ".*\\.tree\\.hnc\\.x-k8s\\.io\\/depth",
  ]
}

provider "helm" {
  kubernetes {
    host                   = "https://${module.infra_data.gke_cluster.endpoint}"
    token                  = data.google_client_config.this.access_token
    cluster_ca_certificate = module.infra_data.gke_cluster.ca_certificate
  }
}

data "vault_generic_secret" "ns1_api_key_terraform" {
  path = "zon/v1/ns1/api/terraform"
}

provider "ns1" {
  apikey                 = data.vault_generic_secret.ns1_api_key_terraform.data["api_key"]
  rate_limit_parallelism = 60
}

module "global_values" {
  source = "git@github.com:ZeitOnline/terraform-modules.git//global_values?ref=global_values-v0.1.0"
}

data "vault_generic_secret" "github_token" {
  path = "zon/v1/github/terraform/api-token"
}

provider "github" {
  token = data.vault_generic_secret.github_token.data["token"]
  owner = "ZeitOnline"
}
