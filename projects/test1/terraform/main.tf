# resource "google_storage_bucket" "test1" {
#   name          = "digger-poc-${var.environment}-test1"
#   location      = "EUROPE-WEST3"
#   storage_class = "STANDARD"

#   uniform_bucket_level_access = true

#   labels = {
#     creator = "terraform"
#   }
# }

variable "environment" {

}

resource "aws_s3_bucket" "example" {
  bucket_prefix = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket ${var.environment}"
    Environment = var.environment
  }
}

