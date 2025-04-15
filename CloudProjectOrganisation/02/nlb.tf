resource "yandex_lb_network_load_balancer" "netology-nlb" {
  name = "netology-nl"
  
  listener {
    name = "netology-listener-nlb"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }


  attached_target_group {
    target_group_id = "${yandex_compute_instance_group.netology_ig.load_balancer.0.target_group_id}"

    healthcheck {
      name = "http"
      interval = 2
      timeout = 1
      unhealthy_threshold = 2
      healthy_threshold = 5

      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
