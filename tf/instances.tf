resource "yandex_compute_disk" "control-plane-disk" {
  name     = "control-plane-disk"
  type     = "network-ssd"
  zone     = "ru-central1-a"
  size     = "20"
  image_id = "fd81u2jojucn3njlptqo"
}

resource "yandex_compute_disk" "worker_disk" {
  count = 2
  name  = "worker-disk-${count.index}"
  type  = "network-ssd"
  zone  = "ru-central1-a"
  size  = "20"
  image_id = "fd81u2jojucn3njlptqo"
}

resource "yandex_compute_instance" "control_plane" {
  name = "k8s-control-plane"

  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    disk_id = yandex_compute_disk.control-plane-disk.id
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.k8s_subnet.id
    nat                = true
  }

  metadata = {
    ssh-keys = "debian:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_compute_instance" "worker" {
  count = 2
  name  = "k8s-worker-${count.index}"

  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    disk_id = yandex_compute_disk.worker_disk[count.index].id
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.k8s_subnet.id
    nat                = true
  }

  metadata = {
    ssh-keys = "debian:${file("~/.ssh/id_ed25519.pub")}"
  }
}
