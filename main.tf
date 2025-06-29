resource "yandex_vpc_network" "ansible" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "ansible" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.ansible.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_os_family
}
resource "yandex_compute_instance" "clickhouse" {
  count = 1
  name        = "clickhouse_server_${count.index}"
  platform_id = var.vm_platform_id
  allow_stopping_for_update = true
  resources {
    cores = var.vm_cpu_count
    memory = var.vm_ram_count
    core_fraction = var.vm_core_fraction
    
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.ansible.id
    nat       = var.vm_nat
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys = "nightnek:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIATCa7b5AkkJuPKo9mYUERJ6dsW9l5np2qpirQFQ4y+9 nightnek@Nightneklaptop"
  }
}

resource "yandex_compute_instance" "lighthouse" {
  count = 1
  name        = "lighthouse_${count.index}"
  platform_id = var.vm_platform_id
  allow_stopping_for_update = true
  resources {
    cores = var.vm_cpu_count
    memory = var.vm_ram_count
    core_fraction = var.vm_core_fraction
    
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.ansible.id
    nat       = var.vm_nat
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys = "nightnek:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIATCa7b5AkkJuPKo9mYUERJ6dsW9l5np2qpirQFQ4y+9 nightnek@Nightneklaptop"
  }
}

resource "yandex_compute_instance" "vector" {
  count = 1
  name        = "vector_${count.index}"
  platform_id = var.vm_platform_id
  allow_stopping_for_update = true
  resources {
    cores = var.vm_cpu_count
    memory = var.vm_ram_count
    core_fraction = var.vm_core_fraction
    
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.ansible.id
    nat       = var.vm_nat
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys = "nightnek:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIATCa7b5AkkJuPKo9mYUERJ6dsW9l5np2qpirQFQ4y+9 nightnek@Nightneklaptop"
  }
}

resource "yandex_vpc_address" "external_address" {
  name = "external-IP"
  external_ipv4_address {
    zone_id = var.default_zone
  }
}

output "server_ip_address_clickhouse" {
  
  value =  yandex_compute_instance.clickhouse[*].network_interface[*].nat_ip_address
 
}

output "server_ip_address_lighthouse" {
  
  value =  yandex_compute_instance.lighthouse[*].network_interface[*].nat_ip_address
 
}

output "server_ip_address_vector" {
  
  value =  yandex_compute_instance.vector[*].network_interface[*].nat_ip_address
 
}