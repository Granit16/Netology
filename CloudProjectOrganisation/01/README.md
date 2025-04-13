# Домашнее задание к занятию «Организация сети»

## Задание 1. Yandex Cloud
1. С помощью Terrform cоздал VPC **netology-vpc**
   
2. Создал "публичную" подсеть с название **public**, сетью 192.168.10.0/24.
 - Создал в подсети NAT-инстанс **netology-nat-vm**, присвоил ему адрес 192.168.10.254. Вкачестве image_id использовал fd80mrhj8fl2oe87o4e1:
```
resource "yandex_compute_instance" "nat_vm" {
  name              = local.nat_vm_name
  platform_id       = var.vm_platform
  hostname          = local.nat_vm_name

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.nat_image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id   = yandex_vpc_subnet.public.id
    nat         = true
    ip_address  = var.nat_vm_ip_adress
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }

}
```


 - Также в этой подсети создал ВМ **netology-public-vm** с публичным IP, подключился к ней и убедился, что доступ к интернету есть:
```
resource "yandex_compute_instance" "public_vm" {
  name              = local.vm1_name
  platform_id       = var.vm_platform
  hostname          = local.vm1_name

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }
}
```


3. Создал "приватную" подсеть с названием **private**, сетью 192.168.20.0/24.
 - Создал таблицу маршрутизации **netology-rt**. Добавил статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс. Указал эту таблицу маршрутизации для подсети **private**:
 ```
resource "yandex_vpc_route_table" "netology-rt" {
  network_id = yandex_vpc_network.netology-vpc.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.nat_vm_ip_adress
  }
}

resource "yandex_vpc_subnet" "private" {
  name           = var.vpc_subnet_name20
  zone           = var.zone_a
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = var.cidr20
  route_table_id = yandex_vpc_route_table.netology-rt.id
}
```

 - Создал в "приватной" подсети виртуалку с внутренним IP, подключился к ней через **public-vm** (пробросив SSH-ключ), и убедился, что доступ к интернету есть.
```
resource "yandex_compute_instance" "private_vm" {
  name              = local.vm2_name
  platform_id       = var.vm_platform
  hostname          = local.vm2_name

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id   = yandex_vpc_subnet.private.id
    nat         = false
    security_group_ids = [yandex_vpc_security_group.sg_private.id]
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }
}
```
