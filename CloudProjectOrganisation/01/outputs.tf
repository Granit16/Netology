output "my_output" {
  value = tolist([
    yandex_compute_instance.public_vm.name,
    yandex_compute_instance.public_vm.network_interface[0].nat_ip_address,
    yandex_compute_instance.public_vm.fqdn,
    
    yandex_compute_instance.private_vm.name,
    yandex_compute_instance.private_vm.fqdn,
  ])
}
