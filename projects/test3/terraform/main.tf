# resource "google_storage_bucket" "test3" {
#   name          = "digger-poc-${var.environment}-test3"
#   location      = "EUROPE-WEST3"
#   storage_class = "STANDARD"

#   uniform_bucket_level_access = true

#   labels = {
#     creator = "terraform"
#   }
# }
