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


variable "zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}


variable "cidr10" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "cidr20" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
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

variable "vpc_subnet_name20" {
  type        = string
  default     = "private"
  description = "VPC network & subnet name"
}

variable "nat_image_id" {
  type          = string
  default       = "fd80mrhj8fl2oe87o4e1"
  description   = "NAT image_id"
}

variable "vm_web_image_family" {
  type          = string
  default       = "ubuntu-2404-lts"
  description   = "Image family name"
}

variable "nat_vm_name" {
  type          = string
  description   = "VM1 name"
  default       = "nat-vm"
}


variable "nat_vm_ip_adress" {
  type          = string
  description   = "NAT vm ip_adress"
  default       = "192.168.10.254"
}

variable "vm1_name" {
  type          = string
  description   = "VM1 name"
  default       = "public-vm"
}

variable "vm2_name" {
  type          = string
  description   = "VM2 name"
  default       = "private-vm"
}

variable "vm_platform" {
  type          = string
  default       = "standard-v2"
  description   = "Platform ID"
}

variable "web_cfg" {
  type          = map
  default       = {cores = 2, memory = 1,  core_fraction = 5}
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
