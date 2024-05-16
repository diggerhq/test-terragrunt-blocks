
variable "environment" {

}

resource "aws_s3_bucket" "example" {
  bucket_prefix = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket ${var.environment}"
    Environment = var.environment
  }
}

