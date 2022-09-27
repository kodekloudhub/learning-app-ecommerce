terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version =  " 0.2.2-alpha.1"
    }
  }
}

# There are currently no configuration options for the provider itself.
resource "virtualbox_vm" "node" {
  count     = 2
  name      = join("-",["server","${var.servers[count.index]}"])
  image     = "https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20180903.0.0/providers/virtualbox.box"
  cpus      = 2
  memory    = "512 mib"
  status    = "running"
  #user_data = file("${path.module}/user_data")

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet0"
  }
}

output "web-ip" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

output "db-ip" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
}
  
