resource "yandex_vpc_network" "netology-vpc" {
  name = var.vpc_name
}


resource "yandex_vpc_subnet" "public" {
  name           = var.vpc_subnet_name10
  zone           = var.zone_a
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = var.cidr10
}
