resource "yandex_vpc_route_table" "netology-rt" {
  network_id = yandex_vpc_network.netology-vpc.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.nat_vm_ip_adress
  }
}
