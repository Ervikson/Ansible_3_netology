resource "yandex_vpc_network" "network" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "subnet" {
  name           = var.subnet_name
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.cidr
}

resource "yandex_compute_instance" "clickhouse" {
  name        = var.clickhouse
  platform_id = var.platform_id
  zone        = var.zone

  scheduling_policy {
    preemptible = true
  }

  resources {
    cores         = var.vm_resources.cores
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image_id
      size     = var.vm_boot_disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.username}:${file(var.ssh_public_key)}"
  }
}

resource "yandex_compute_instance" "vector" {
  name        = var.vector
  platform_id = var.platform_id
  zone        = var.zone

  scheduling_policy {
    preemptible = true
  }

  resources {
    cores         = var.vm_resources.cores
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image_id
      size     = var.vm_boot_disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.username}:${file(var.ssh_public_key)}"
  }
}

resource "yandex_compute_instance" "lighthouse" {
  name        = var.lighthouse
  platform_id = var.platform_id
  zone        = var.zone

  scheduling_policy {
    preemptible = true
  }

  resources {
    cores         = var.vm_resources.cores
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image_id
      size     = var.vm_boot_disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.username}:${file(var.ssh_public_key)}"
  }
}

