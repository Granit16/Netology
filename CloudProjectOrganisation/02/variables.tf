variable "cloud_id" {
  type        = string
  default     = "b1g7ku1grchdocbtc6bj"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g4muqc9k5bt45lm3d1"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}


variable "zone_a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}


variable "cidr10" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "netology-vpc"
  description = "VPC network & subnet name"
}

variable "vpc_subnet_name10" {
  type        = string
  default     = "public"
  description = "VPC network & subnet name"
}

variable "lamp_image_id" {
  type = string
  default = "fd827b91d99psvq5fjit"
  description = "LAMP image_id"
}

variable "vm_platform" {
  type          = string
  default       = "standard-v2"
  description   = "Platform ID"
}

variable "vms_resources" {
  type          = map
  default       = {
                    web = {
                      cores = 2
                      memory = 1
                      core_fraction = 5
                    }
  }
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOuSJ7oNhg72ENaJfgIbPHinHDfOpjndDOrYZ8trvyA9"
  description = "ssh-keygen -t ed25519"
}


variable "bucket_name" {
  type = string
  default = "damir20250415"
  description = "Bucket name"
}

variable "instance_group_name" {
  type = string
  default = "netology-ig"
  description = "Instance group name"
}
