resource "yandex_kms_symmetric_key" "netology-key" {
  name              = "netology-key"
  description       = "description for netology-key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" // equal to 1 year
}
