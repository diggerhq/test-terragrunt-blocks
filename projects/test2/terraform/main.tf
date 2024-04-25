# resource "google_storage_bucket" "test2" {
#   name          = "digger-poc-${var.environment}-test2"
#   location      = "EUROPE-WEST3"
#   storage_class = "STANDARD"

#   uniform_bucket_level_access = true

#   labels = {
#     creator = "terraform"
#   }
# }
