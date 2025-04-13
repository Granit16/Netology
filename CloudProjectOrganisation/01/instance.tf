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
