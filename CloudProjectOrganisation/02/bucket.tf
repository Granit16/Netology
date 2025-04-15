resource "yandex_storage_bucket" "test-bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
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
