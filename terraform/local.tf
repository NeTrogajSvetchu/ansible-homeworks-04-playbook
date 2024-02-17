locals {
  ssh_key = file("~/.ssh/id_ed25519.pub")
}
/*
locals {

    clickhouse = yandex_compute_instance.ansible_vm[0]
    vector = yandex_compute_instance.ansible_vm[0]
    lighthouse = yandex_compute_instance.ansible_vm[2]
}*/