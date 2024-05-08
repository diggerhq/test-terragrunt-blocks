include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "../../terraform//."
}

inputs = {
  cluster_name = "env4"
  environment  = "env4"
}
