# resource "google_storage_bucket" "test1" {
#   name          = "digger-poc-${var.environment}-test1"
#   location      = "EUROPE-WEST3"
#   storage_class = "STANDARD"

#   uniform_bucket_level_access = true

#   labels = {
#     creator = "terraform"
#   }
# }
