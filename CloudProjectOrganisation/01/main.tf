resource "yandex_vpc_network" "netology-vpc" {
  name = var.vpc_name
}


resource "yandex_vpc_subnet" "public" {
  name           = var.vpc_subnet_name10
  zone           = var.zone_a
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = var.cidr10
}


resource "yandex_vpc_subnet" "private" {
  name           = var.vpc_subnet_name20
  zone           = var.zone_a
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = var.cidr20
  route_table_id = yandex_vpc_route_table.netology-rt.id
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}
