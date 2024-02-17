

resource "null_resource" "web_hosts_provision" {
/*
  provisioner "local-exec" {
    command = "cat ~/.ssh/id_ed25519 | ssh-add -"
  }
  
  provisioner "local-exec" {
    command = "sleep 60"
  }
  */
  provisioner "local-exec" {                  
    command  = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i /media/sf_distr/ansible-homeworks/ansible-homeworks-04-playbook/inventory/prod.cfg /media/sf_distr/ansible-homeworks/ansible-homeworks-04-playbook/site.yml"
    on_failure = continue 
    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
  }
    triggers = {  
      always_run         = "${timestamp()}" 
      playbook_src_hash  = file("/media/sf_distr/ansible-homeworks/ansible-homeworks-04-playbook/site.yml") 
      ssh_public_key     = local.ssh_key 
    }
  }
  