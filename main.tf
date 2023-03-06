terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.85.0"
    }
  }
}

variable "do_token" {}

provider "yandex" {
  token                    = var.do_token
  cloud_id                 = "b1gkqmeb78fvjnt2v4l0"
  folder_id                = "b1gehg0ubsrm43k3r9dt"
  zone                     = "ru-central1-b"
}

resource "yandex_compute_instance" "web1" {
  name        = "web1"
  platform_id = "standard-v1"
  zone        = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8emvfmfoaordspe1jr"
    }
  }

  network_interface {
    subnet_id = "e2ltp7arenrspgbu9usv"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "web2" {
  name        = "web2"
  platform_id = "standard-v1"
  zone        = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8emvfmfoaordspe1jr"
    }
  }

  network_interface {
    subnet_id = "e2ltp7arenrspgbu9usv"
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}