resource "yandex_storage_bucket" "test-bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.netology-key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "yandex_storage_object" "upload_pic" {
  bucket     = var.bucket_name
  key        = "man.jpeg"
  source     = "media/gomer.jpeg"
  acl    = "public-read"
  content_type = "image/jpeg"

  depends_on = [
    yandex_storage_bucket.test-bucket
  ]
}
