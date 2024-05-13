# don't include in run-all
skip = true

# Terragrunt config relevant for all terragrunt files
locals {
  # helpers
  root_dir    = get_parent_terragrunt_dir()
  project_dir = "${get_terragrunt_dir()}/../../"

  # remote module conf
  # module_remote_url = "git::ssh://git@github.com/ZeitOnline/terraform-modules.git"
  # module_remote_ref = "main"

  # tf_modules = "${get_repo_root()}/terraform-modules"
}


remote_state {
  backend = "s3"
  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = "digger-tests-bucket"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "dynamo-lock-table"
  }
}

# generate "providers" {
#   path      = "_providers_common.tf"
#   if_exists = "overwrite"
#   contents  = file("${local.root_dir}/_templates/providers_common.tf")
# }

# generate "context" {
#   path      = "_context.tf"
#   if_exists = "overwrite"
#   contents  = file("${local.root_dir}/_templates/context.tf")
# }

# generate "inputs" {
#   path      = "_inputs.tf"
#   if_exists = "overwrite"
#   contents  = file("${local.root_dir}/_templates/inputs.tf")
# }

// generate "metadata" {
//   path      = "_project-metadata.tf"
//   if_exists = "overwrite"
//   contents  = <<EOF
// locals {
//     project_metadata = jsondecode(${jsonencode(file("${local.project_dir}/project-metadata.json"))})
// }
// EOF
// }


