resource "yandex_iam_service_account" "netology-sa" {
  name        = "netology-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
  folder_id = var.folder_id
  role      = "admin"
  member    = "serviceAccount:${yandex_iam_service_account.netology-sa.id}"
}

resource "yandex_compute_instance_group" "netology_ig" {
  name                = var.instance_group_name
  folder_id           = var.folder_id
  service_account_id  = "ajedubvg7gd2hsdqmpo6"
  deletion_protection = false

  instance_template {
    platform_id = var.vm_platform

    resources {
      cores         = var.vms_resources.web.cores
      memory        = var.vms_resources.web.memory
      core_fraction = var.vms_resources.web.core_fraction
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = var.lamp_image_id
        size     = 4
      }
    }

    network_interface {
      network_id = yandex_vpc_network.netology-vpc.id
      subnet_ids = ["${yandex_vpc_subnet.public.id}"]
      nat        = true
    }

    labels = {
      label1 = "label1-value"
      label2 = "label2-value"
    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/terrform_key")}"
      serial-port-enable = "1"
       user-data  = <<EOF
#!/bin/bash
echo '<html><head><title>MyTitle</title></head> <body><h1>Hello, world!!!</h1><img src="https://storage.yandexcloud.net/damir20250415/man.jpeg"/><br>' > /var/www/html/index.html
curl 2ip.ru >> /var/www/html/index.html
echo '</body></html>' >> /var/www/html/index.html
EOF
    }

    network_settings {
      type = "STANDARD"
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  deploy_policy {
    max_unavailable = 2
    max_creating    = 1
    max_expansion   = 2
    max_deleting    = 1
  }

  load_balancer {
    target_group_name = "nlb-target"
  }
}
