resource "virtualbox_vm" "node" {
  count     = 1
  name      = format("node-%02d", count.index + 1)
  image     = "https://app.vagrantup.com/generic/boxes/ubuntu2204/versions/4.2.16/providers/virtualbox.box"
  cpus      = 2
  memory    = "1024 mib"
  #user_data = file("${path.module}/user_data")

  network_adapter {
    type           = "hostonly"
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }

  # network_adapter {
  #  type           = "bridged"
  #  host_interface = "Intel(R) Wireless-AC 9462"
  # }

}

output "IPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

