data "yandex_compute_image" "centos" {
  family = var.vm_family
}
resource "yandex_compute_instance" "ansible_vm" {
    platform_id = var.platform_id 
    for_each = {for idx, value in var.ansible_vm : idx => value}
    name          = each.value ["name"]    
  resources {    
      cores         = each.value ["cores"]
      memory        = each.value ["memory"]
      core_fraction = each.value ["core_fraction"]
  }  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos.image_id
      size          = each.value ["size"]
      type          = each.value ["type"]
    }

  }
  scheduling_policy {
    preemptible = var.scheduling_policy
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_nat
    
  }
  metadata = {
    user-data = file("${path.module}/cloud_config.yaml")
    serial-port-enable = var.metadata.serial-port-enable
    ssh-keys           = "${local.ssh_key}"
  }
}