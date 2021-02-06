proxmox_connection = {
    url       = "https://<proxmox ipaddress|fqdn>:8006/api2/json"
    username  = "<proxmox username>"
    password  = "<proxmox password>"
    insecure  = <true|false>
}

pihole_001 = {
    cloudinit_username  = "<cloudinit username>"
    cloudinit_password  = "<cloudinit password>"
    cloudinit_ipaddress = "<vm ip address, e.g.: 192.168.0.101>"
    cloudinit_cidr      = "<vm ip address cidr, e.g.: 24>"
    cloudinit_gateway   = "<vm gateway address>"
    cloudinit_dns1      = "<vm upstream dns ipaddress 1>"
    cloudinit_dns2      = "<vm upstream dns ipaddress 2>"
    vm_template         = "<vm template name in proxmox>"
    vm_id               = <vm id 1>
    vm_name             = "<vm name 1>"
    vm_description      = "Pi-Hole DNS"
    vm_node             = "<proxmox node name>"
    vm_qemu_agent       = 1
    vm_cpu_cores        = "1"
    vm_cpu_sockets      = "1"
    vm_cpu_type         = "kvm64"
    vm_vcpu             = "1"
    vm_memory           = "1024"
    vm_net_model        = "virtio"
    vm_net_bridge       = "vmbr1"
    vm_net_vlan         = <vm network vlan id, e.g.: 1024>
}

pihole_002 = {
    cloudinit_username  = "<cloudinit username>"
    cloudinit_password  = "<cloudinit password>"
    cloudinit_ipaddress = "<vm ip address, e.g.: 192.168.0.101>"
    cloudinit_cidr      = "<vm ip address cidr, e.g.: 24>"
    cloudinit_gateway   = "<vm gateway address>"
    cloudinit_dns1      = "<vm upstream dns ipaddress 1>"
    cloudinit_dns2      = "<vm upstream dns ipaddress 2>"
    vm_template         = <vm template name in proxmox>
    vm_id               = <vm id 2>
    vm_name             = "<vm name 2>"
    vm_description      = "Pi-Hole DNS"
    vm_node             = "<proxmox node name>"
    vm_qemu_agent       = 1
    vm_cpu_cores        = "1"
    vm_cpu_sockets      = "1"
    vm_cpu_type         = "kvm64"
    vm_vcpu             = "1"
    vm_memory           = "1024"
    vm_net_model        = "virtio"
    vm_net_bridge       = "vmbr1"
    vm_net_vlan         = <vm network vlan id>
}

pihole_003 = {
    cloudinit_username  = "<cloudinit username>"
    cloudinit_password  = "<cloudinit password>"
    cloudinit_ipaddress = "<vm ip address, e.g.: 192.168.0.101>"
    cloudinit_cidr      = "<vm ip address cidr, e.g.: 24>"
    cloudinit_gateway   = "<vm gateway address>"
    cloudinit_dns1      = "<vm upstream dns ipaddress 1>"
    cloudinit_dns2      = "<vm upstream dns ipaddress 2>"
    vm_template         = <vm template name in proxmox>
    vm_id               = <vm id 3>
    vm_name             = "<vm name 3>"
    vm_description      = "Pi-Hole DNS"
    vm_node             = "<proxmox node name>"
    vm_qemu_agent       = 1
    vm_cpu_cores        = "1"
    vm_cpu_sockets      = "1"
    vm_cpu_type         = "kvm64"
    vm_vcpu             = "1"
    vm_memory           = "1024"
    vm_net_model        = "virtio"
    vm_net_bridge       = "vmbr1"
    vm_net_vlan         = <vm network vlan id>
}

iac_scripts = {
    git_repository      = "https://github.com/CoreLayer/iac-scripts"
    tmp_directory       = "/tmp/iac-scripts"
}

pihole = {
    webpassword         = "<web password for Pi-hole admin>"
}
